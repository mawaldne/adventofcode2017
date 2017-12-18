#!/usr/bin/env ruby -w

require 'ostruct'

# To Run
# ./hex_ed.rb input.txt

# see https://www.redblobgames.com/grids/hexagons/
# Using cube coordinates


def cube_distance(a, b)
  ((a.x - b.x).abs + (a.y - b.y).abs + (a.z - b.z).abs) / 2.0
end

movements = {
  n:  {y: 1, x: 0, z:-1},
  ne: {y: 0, x: 1, z: -1},
  se: {y: -1, x: 1, z: 0},
  s: {y: -1, x: 0, z: 1},
  sw: {y: 0, x: -1, z: 1},
  nw: {y: 1, x: -1, z: 0}
}

y, x, z = 0,0,0
max = 0

directions = ARGF.read.strip.split(',')
directions.each do |direction|
  movement = movements[direction.to_sym]
  y += movement[:y]
  x += movement[:x]
  z += movement[:z]
  distance = cube_distance(OpenStruct.new(y: 0, x: 0, z: 0),
                           OpenStruct.new(y: y, x: x, z: z))
  max = [max, distance].max
end

p cube_distance(OpenStruct.new(y: 0, x: 0, z: 0),
                OpenStruct.new(y: y, x: x, z: z))

p max
