# challenge is to create a blanket pattern by returning a string and each loop, taking the first character of that string and moving it to the end of the string

str = "RRGGBBYYKK"
lines = 20

lines.times do |n|
  first = str[0]
  rest = str[1..-1]
  str = rest + first
  puts str
end

