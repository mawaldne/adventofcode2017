#!/usr/bin/env ruby -w

# To Run
# ./memory_reallocations.rb input.txt

class MemoryReallocator
  def initialize(input)
    @memory = input.split.map(&:to_i).to_a
  end

  def redistribute
    until history[@memory]
      history[@memory] = history.keys.length
      distribute
    end
    self
  end

  def cycles
    history.keys.length
  end

  def loop_size
    cycles - history[@memory]
  end

  private

  def distribute
    idx = @memory.index(@memory.max)
    blocks = @memory[idx]
    @memory[idx] = 0

    blocks.times do |i|
      @memory[(idx + i + 1) % @memory.length] += 1
    end
  end

  def history
    @history ||= {}
  end
end

memory = MemoryReallocator.new(ARGF.read.strip).redistribute
p "Part 1: #{memory.cycles}"
p "Part 2: #{memory.loop_size}"
