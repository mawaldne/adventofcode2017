#!/usr/bin/env ruby -w

# To Run
# ./corruptions_checksum2.rb day2.input

numbers = []
ARGF.each_line do |row|
  numbers << row
    .split
    .map { |c| c.to_i }
    .permutation(2)
    .select { |a,b| a % b == 0 }
    .map { |a,b| a / b }
    .first
end
p numbers.reduce(:+)
