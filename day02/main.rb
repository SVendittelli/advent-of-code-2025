# frozen_string_literal: true

# file_name = 'example.txt'
file_name = 'input.txt'
line = File.read(File.join(__dir__, file_name))

ranges = line.split(',')

def is_symetric(input)
  return false if input.length.odd?

  half = input.length / 2
  first = input[0, half]
  second = input[half..]

  first == second
end

sum = 0

ranges.each do |range|
  first, last = range.split('-')

  (first.to_i..last.to_i).each do |id|
    sum += id if is_symetric(id.to_s)
  end
end

puts "Part 1: #{sum}"
