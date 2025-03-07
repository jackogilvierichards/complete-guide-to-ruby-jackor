#! /usr/bin/env ruby

# fill-in-the-blanks game (mad libs) - think of a sentence or two with several blanks

# there once was a cat called ___, they liked to ___ in the morning. 
# By lunchtime they were dining on ___ food, but they fell into a ____ sleep by nighttime.

blanks = ['noun','verb','adjective','adjective']

# prompt a user to provide a string for each type of word, save that response, then output the sentence

puts "----------------------------------"
puts "Welcome to The Ruby Mad-Lib Game!"
puts "----------------------------------"
puts "Give me a noun!"
print "> "

answers = blanks.map do |request|
  article

