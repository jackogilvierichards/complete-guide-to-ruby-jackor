require 'csv'
require_relative 'restaurant'

# Class for the restaurant guide behaviors
# Responds to: list, find, add, help
module RFinder
  class Guide

    @@storage_filename = 'restaurants.csv'
    @@width = 60

    def initialize
      # find storage file; set @storage_path
      initialize_storage_file
      # if initialized without error, return self
      self
     rescue => e
      abort("Fatal error: #{e.message}")
    end

    def list(args=[])
      output_header("Listing restaurants")
      sort_order = extract_sort_order(args)
      restaurants = sort_restaurants(all_restaurants, sort_order)
      output_listings(restaurants)
    end

    def find(keyword="")
      output_header("Find a restaurant")
      restaurants = filter_restaurants(all_restaurants, keyword)
      output_listings(restaurants)
    end

    def add
      output_header("Add a restaurant")
      rest = Restaurant.new_from_questions
      array = [rest.name, rest.cuisine, rest.price]
      CSV.open(@storage_path, 'a') do |csv|
        csv << array
      end
      puts "\nRestaurant saved\n\n"
    end

    def help
      output_header('Help')
      puts "list: list all restaurants"
      puts "  Sortable by: name, cuisine, price"
      puts "  Example: 'list cuisine' or 'list by cuisine'"
      puts
      puts "find: find a restaurant using a keyword"
      puts "  Example: 'find mex' or 'find 25'"
      puts
      puts "add: add a new restaurant to the list"
      puts
    end

    private

    def initialize_storage_file
      # locate storage file in APP_ROOT
      @storage_path = File.join(APP_ROOT, @@storage_filename)
      unless File.exist?(@storage_path)
        create_storage_file
      end
      unless storage_file_usable?
        raise "Storage file is not usable."
      end
    end

    def create_storage_file
      headers = ["Name", "Cuisine, Price"]
      initial_content = headers.join(',') + "\n"
      File.write(@storage_path, initial_content)
    end

    def storage_file_usable?
      return false unless @storage_path
      return false unless File.exist?(@storage_path)
      return false unless File.readable?(@storage_path)
      return false unless File.writable?(@storage_path)
      return true
    end

  	def output_header(text)
  	  puts "\n#{text.upcase.center(@@width)}\n\n"
  	end
	
  	def output_listings(restaurants=[])
      div = " "
      cols = [30,20,6]
      print div + "Name".ljust(cols[0])
      print div + "Cuisine".ljust(cols[1])
      print div + "Price".rjust(cols[2])
      print div + "\n"
      puts "-" * @@width
      restaurants.each do |rest|
        print div + rest.name.titleize.ljust(cols[0])
        print div + rest.cuisine.titleize.ljust(cols[1])
        print div + rest.formatted_price.rjust(cols[2])
        print div + "\n"
      end
      puts div + "No listings found" if restaurants.empty?
      puts "-" * @@width
    end

    def all_restaurants
      # To consider: get a fresh copy each time
      # or store results in an instance variable?
      restaurants = []
      CSV.foreach(@storage_path, headers: true) do |row|
        rest = RFinder::Restaurant.new
        rest.name = row['Name']
        rest.cuisine = row['Cuisine']
        rest.price = row['Price']
        restaurants << rest
      end
      restaurants
    end

    def extract_sort_order(args=[])
      valid_sorts = ['name', 'cuisine', 'price']
      order = args.shift
      order = args.shift if order == 'by'
      order = "name" unless valid_sorts.include?(order)
      order
    end

    def sort_restaurants(restaurants, sort_order="name")
      restaurants.sort do |r1, r2|
        case sort_order
        when 'name'
          r1.name.downcase <=> r2.name.downcase
        when 'cuisine'
          r1.cuisine.downcase <=> r2.cuisine.downcase
        when 'price'
          r1.price.to_i <=> r2.price.to_i
        end
      end
    end

    def filter_restaurants(restaurants, keyword="")
      kw = keyword.downcase
      restaurants.select do |r|
        r.name.downcase.include?(kw) || 
        r.cuisine.downcase.include?(kw) || 
        r.price.to_i <= keyword.to_i
      end
    end

  end
end
