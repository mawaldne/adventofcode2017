#!/usr/bin/env ruby -w

require 'set'
require 'pp'

# To Run
# ./digital_plumber.rb input.txt

nodes = {}

ARGF.each_line do |node|
  if node =~ /(\d*) <-> (.*)/
    key = $1.to_i
    values = $2.split(",").map(&:to_i)
    nodes[key] = values
  end
end

connected = Set.new
check = []

nodes.each do |k, v|
  check = [k]
  visited = Set.new

  loop {
    if visited.include?(0)
      connected << k
      check = []
    else
      current = check.shift
      visited += [current]
      check += nodes[current] - visited.to_a
    end

      break if check.empty?
  }
end

p connected.length

