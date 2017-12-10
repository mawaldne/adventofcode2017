#!/usr/bin/env ruby -w

# To Run
# ./corruptions_checksum2.rb day2.input

p ARGF.each_line
  .map { |row| row.split.map(&:to_i) }
  .map { |row| row.permutation(2) }
  .map { |row| row.find { |a,b| a % b == 0 } }
  .map { |a,b| a / b }
  .reduce(:+)
