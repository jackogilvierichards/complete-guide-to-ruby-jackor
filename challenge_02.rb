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