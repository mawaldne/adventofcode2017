#!/usr/bin/env ruby -w

# To Run
# ./spiral_memory.rb #NUM#

class SpiralMap
  def initialize(n)
    @size = (n ** 0.5).ceil
    # Create odd size spiral so we have a center position
    @size = @size + 1 if @size % 2 == 0
    generate
  end

  def generate
    val = 1
    pos = center
    value_to_position[val] = pos

    return if @size == 1

    runs.zip(directions.cycle).each do |run, direction|
      dx, dy = direction
      run.times do
        val += 1
        x, y = pos
        pos = [x + dx, y + dy]
        value_to_position[val] = pos
      end
    end
  end

  # Distance of each spiral movement
  def runs
    runs = (0..@size).each_cons(2).to_a.flatten  # n==5; [0,1,1,2,2,3,3,4,4,5]
    runs.shift
    runs
  end

  # Spiral movement pattern -> right, up, left, down
  def directions
    [[1,0], [0,1], [-1,0], [0,-1]]
  end

  def center
    [@size / 2, @size/ 2]
  end

  def value_to_position
    @value_to_position ||= {}
  end

  def distance(start, ending)
    x1,y1 = value_to_position[start]
    x2,y2 = value_to_position[ending]
    (x2-x1).abs + (y2-y1).abs
  end
end

n = ARGV[0].to_i
distance = SpiralMap.new(n).distance(1, n)

p "The distance is #{distance}"
