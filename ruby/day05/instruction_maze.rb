#!/usr/bin/env ruby -w

# To Run
# ./instruction_maze.rb day4.input

instructions = ARGF.each_line.map { |row| row.to_i }

pos = 0
steps = 0
loop do
  move = instructions[pos]
  instructions[pos] += 1
  pos += move
  steps += 1
  break unless pos.between?(0, instructions.length - 1)
end

p steps
