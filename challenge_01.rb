# challenge is to create a blanket pattern by returning a string and each loop, taking the first character of that string and moving it to the end of the string

str = "RRGGBBYYKK"
lines = 20

lines.times do |n|
  first = str[0]
  rest = str[1..-1]
  str = rest + first
  puts str
end

pattern = "++*~~*++*"

pattern_array = pattern.split("")

lines.times do |n|
  first = pattern_array.shift #take first item in array
  pattern_array << first #appends the first value onto the end of the pattern array
  puts pattern_array.join #returns the string version of the array (joined together to make a string again after being split)
end