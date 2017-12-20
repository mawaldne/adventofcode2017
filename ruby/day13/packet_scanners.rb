#!/usr/bin/env ruby -w

require 'pp'

# To Run
# ./packet_scanners.rb input.txt

depth_to_range = {}

ARGF.each_line do |node|
  if node =~ /(\d*): (\d*)/
    key = $1.to_i
    value = $2.to_i
    depth_to_range[key] = value
  end
end

# The Scanners will reach the top (position 0) every (range - 1) * 2 times.
# For example, range (length) = 4. It cycles like so:
# [0,1,2,3,2,1,0,1,2,3,1,2,0...]
# 0 is at 0, 6, 12, 18, ....  every (4 - 1) * 2 = 6 times.
p depth_to_range
  .select { |depth, range| depth % ((range - 1) * 2) == 0 }
  .map {|depth, range| depth * range }
  .reduce(:+)


