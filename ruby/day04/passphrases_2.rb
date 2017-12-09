#!/usr/bin/env ruby -w

# To Run
# ./passphrases_2.rb day4.input

successful = ARGF.each_line.with_object([]) do |row, array|
  array << row
    .split
    .combination(2)
    .select { |a,b| a.chars.sort.join == b.chars.sort.join }
    .empty?
end
p successful
p successful.select { |s| s }.length
