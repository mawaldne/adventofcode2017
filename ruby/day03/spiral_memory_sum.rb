#!/usr/bin/env ruby -w

# To Run
# ./spiral_memory.rb #NUM#

class SpiralMapSum

  def initialize(n)
    @size = (n ** 0.5).ceil
    # Create odd size spiral so we have a center position
    @size = @size + 1 if @size % 2 == 0
    generate
  end

  def generate
    val = 1
    pos = center
    position_to_value[center] = val

    return if @size == 1

    runs.zip(directions.cycle).each do |run, direction|
      dx, dy = direction
      run.times do
        x, y = pos
        pos = [x + dx, y + dy]
        position_to_value[pos] = adjacent_sum(*pos)
      end
    end
  end

  # Distance of each spiral movement
  def runs
    runs = (0..@size).each_cons(2).to_a.flatten  # n==5; [0,1,1,2,2,3,3,4,4,5]
    runs.shift
    runs
  end

  def directions
    [[1,0], [0,1], [-1,0], [0,-1]]
  end

  #  0 0 0
  #  0 o 0
  #  0 0 0
  def adjacent_directions
    [[1,0], [1,1], [0,1], [-1,1], [-1, 0], [-1,-1], [0, -1], [1, -1]]
  end

  def center
    [@size / 2, @size/ 2]
  end

  def position_to_value
    @position_to_value ||= {}
  end

  def adjacent_sum(x, y)
    adjacent_directions.map do |dx, dy|
      pos = [x + dx, y + dy]
      position_to_value[pos]
    end.compact.reduce(:+)
  end

  def largest_after(n)
    position_to_value.values.sort.select { |a| a > n }.first
  end
end

n = ARGV[0].to_i
largest_after = SpiralMapSum.new(n).largest_after(n)

p "The largest value is #{largest_after}"
