# file_name = "example.txt"
file_name = "input.txt"
lines = File.readlines(File.join(__dir__, file_name))

# The dial starts at 50 initially
value = 50
count = 0

lines.each do |line|
  line[0] == "L" ? value -= line[1..].to_i : value += line[1..].to_i
  value = value % 100
  # puts value
  if value == 0
    count += 1
  end
end

puts count
