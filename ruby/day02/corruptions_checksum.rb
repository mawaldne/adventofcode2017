#!/usr/bin/env ruby -w

# To Run
# ./day2.rb day2.input

checksum = 0
ARGF.each_line do |row|
  numbers = row.split.map { |c| c.to_i }
  checksum += numbers.max - numbers.min
end
puts checksum
