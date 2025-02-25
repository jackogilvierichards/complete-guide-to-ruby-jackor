#Challenge 2 - Guessing Game

# ask a player for their name and store it
# say hello and explain the rules
# pick a random number between 1 and 10
# get player's guess
# tell player whether their guess was correct
# loop to give player 3 tries if they didn't get the correct value
# exit once they get the correct answer

[*1..10].shuffle.first #range we are interested in, return as array type, shuffle the order of values in array,  
rand(100) # returns an integer in 0..99

puts "----------------------------------"
puts "Welcome to The Ruby Guessing Game!"
puts "----------------------------------"
puts "What's your name, thou noble sire?"
puts "----------------------------------"
response_1 = gets.chomp
sleep 1
puts "----------------------------------"
puts "Hello, #{response_1}, and welcome!"
puts "----------------------------------"
puts "The rules are as follows: I will"
puts "pick any number between 1-10 and"
puts "you will get 3 tries to guess it!"
puts "----------------------------------"
puts "----------------------------------"
puts "Okay, here goes nothing - game on!"
puts "----------------------------------"
rand_num = [*1..10].shuffle.first
sleep 1
puts "Can you guess what number I chose?"
puts rand_num
puts "----------------------------------"


3.times do |n|
  guess = gets.chomp.to_i
  if guess == rand_num
    puts "----------------------------------"
    puts "Congratulations! You are correct! "
    puts "       Thanks for playing!        "
    puts "----------------------------------"
    exit!
  else
    puts "----------------------------------"
    puts "Uh Oh - That wasn't the right one!"
    puts "----------------------------------"
    puts "Please try again, you've got this!"
    puts "----------------------------------"
  end
end

puts "That's the end for now, better luck next time!"

