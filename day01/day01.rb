# File.read: Reads the entire file content as a string
# file = File.read("example.txt")

# File.readlines: Reads the file into an array, splitting by lines.
# lines = File.readlines("example.txt")
# lines.each { |line| puts line }

# File.open: Opens the file and provides more control (e.g., modes like read, write).
# File.open("example.txt", "r") do |file|
#   file.each_line { |line| puts line }
# end
input = ARGV[0] || "example.txt"
file = File.readlines(input)

left_list = []
right_list = []
total = 0

list = file.map do |line|
  left_list << line.split[0].to_i
  right_list << line.split[1].to_i
end

left_list, right_list = left_list.sort, right_list.sort

# part 1
# left_list.each_with_index do |value, index|
#   total += (value - right_list[index]).abs
# end

# part 2
left_list.each do |number|
  similarity = right_list.count(number)
  total += number * similarity
end

puts total
