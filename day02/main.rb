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

def is_repeated(input)
  half = input.length / 2
  (1..half).each do |num|
    next if input.length % num != 0
    return true if input.scan(/.{1,#{num}}/).uniq.length == 1
  end
  false
end

sum1 = 0
sum2 = 0

ranges.each do |range|
  first, last = range.split('-')

  (first.to_i..last.to_i).each do |id|
    sum1 += id if is_symetric(id.to_s)
    sum2 += id if is_repeated(id.to_s)
  end
end

puts "Part 1: #{sum1}"
puts "Part 2: #{sum2}"
