#!/usr/bin/env ruby -w

# To Run
# ./passphrases.rb day4.input

successful = ARGF.each_line.with_object([]) do |row, array|
  array << row
    .split
    .combination(2)
    .select { |a,b| a == b }
    .empty?
end

p successful.select { |s| s }.length
