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

check = [0]
connected = Set.new

while check.any?
  pg = check.pop
  connected.add(pg)
  check += nodes[pg].reject { |pro| connected.include?(pro) }
end

puts connected.size

