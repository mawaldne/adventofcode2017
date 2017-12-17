#!/usr/bin/env ruby -w

require 'pp'

# To Run
# ./know_hash.rb input.txt

sub_lengths = ARGF.read.strip.split(',').map(&:to_i)
list = 256.times.each_with_object([]) { |i, arr| arr << i }
skip = 0
cursor = 0

sub_lengths.each do |sub_length|
  positions = sub_length.times.map { |i| (cursor + i) % list.length }
  sublist = positions.map { |i| list[i] }.reverse
  positions.zip(sublist).each do |position, value|
    list[position] = value
  end
  cursor = (cursor + sub_length + skip) % list.length
  skip += 1
end

pp list[0,2].reduce(&:*)

