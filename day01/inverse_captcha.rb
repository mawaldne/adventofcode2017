#!/usr/bin/env ruby -w

# To Run
# ./day1.rb day1.input

input = ARGF.read.strip

numbers = input.chars.map(&:to_i).to_a
numbers << numbers[0]

p numbers
  .each_cons(2)
  .select { |a,b| a == b }
  .map { |a,b| a }
  .reduce(0,:+)
