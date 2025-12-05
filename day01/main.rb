# file_name = "example.txt"
file_name = "input.txt"
lines = File.readlines(File.join(__dir__, file_name))

# The dial starts at 50 initially
value = 50
count1 = 0
count2 = 0

lines.each do |line|
  dir = line[0] == "L" ? -1 : 1
  dist = line[1..].to_i

  old_value = value
  value += dir * dist
  value = value % 100

  # puts value
  if value == 0
    count1 += 1
  end

  dist.times do |i|
    if (old_value + (dir * i)) % 100 == 0
      count2 += 1
    end
  end
end

puts "Part 1: " + count1.to_s
puts "Part 2: " + count2.to_s
