#!/usr/bin/env ruby -w

require 'pp'

# To Run
# ./know_hash.rb input.txt

lengths = ARGF.read.strip.split(',').map(&:to_i)
list = (0..(256 - 1)).to_a

skip = 0
cursor = 0

lengths.each do |length|
  positions = length.times.map { |i| (cursor + i) % list.length }
  sublist = positions.map { |i| list[i] }.reverse
  positions.zip(sublist).each do |position, value|
    list[position] = value
  end
  cursor = (cursor + length + skip) % list.length
  skip += 1
end

pp list[0,2].reduce(&:*)

