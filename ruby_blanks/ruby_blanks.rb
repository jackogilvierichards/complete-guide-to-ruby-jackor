#!/usr/bin/env ruby

puts "-" * 15
puts "| Ruby Blanks |"
puts "-" * 15
puts
puts "You provide a series of words."
puts "I will use those words to fill in the blanks in a story."
puts

blanks = ['verb', 'adjective', 'adjective', 'noun']

vowels = ['a', 'e', 'i', 'o', 'u']

answers = blanks.map do |request|
  article = vowels.include?(request[0]) ? 'an' : 'a'
  print "Give me #{article} #{request}: "
  response = gets.chomp
end

text = "I decided to #{answers[0]} a #{answers[1]} party for my #{answers[2]} #{answers[3]}."

puts
puts "Here's your completed story:"
puts
puts text
puts
