#!/usr/bin/env ruby -w

# To Run
# ./day1.rb day1.input

input = ARGF.read.strip

numbers = input.chars.map(&:to_i).to_a
length = numbers.length
mid = length / 2

p numbers
  .map
  .with_index { |a, i| [a, numbers[(i + mid) % length]] }
  .select { |a,b| a == b }
  .map { |a,b| a }
  .reduce(0,:+)
