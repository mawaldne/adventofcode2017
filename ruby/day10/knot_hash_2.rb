#!/usr/bin/env ruby -w

require 'pp'

# To Run
# ./know_hash.rb input.txt

lengths = ARGF.read.strip.chars.map(&:ord)
lengths += [17, 31, 73, 47, 23]
list = (0..(256 - 1)).to_a

skip = 0
idx = 0

64.times {
  lengths.each do |length|
    positions = length.times.map { |i| (idx + i) % list.length }
    sublist = positions.map { |i| list[i] }.reverse
    positions.zip(sublist).each do |position, value|
      list[position] = value
    end
    idx = (idx + length + skip) % list.length
    skip += 1
  end
}

pp list
  .each_slice(16)
  .map { |block| block.reduce(&:^) }
  .map { |i| i.to_s(16).rjust(2,"0") }
  .join
