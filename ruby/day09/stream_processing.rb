#!/usr/bin/env ruby -w

require 'pp'

# To Run
# ./stream_processing.rb input.txt

input = ARGF.read.strip

clean_stream = input.gsub(/!./,"").gsub(/<.*?>/,"")
p clean_stream
score = 0
total = 0
clean_stream.chars.each do |char|
  if char == '{'
    score += 1
  elsif char == '}'
    total += score
    score -= 1
  end
end
p total

# Part 2
garbage_count =
  input
  .gsub(/!./,"")
  .scan(/<.*?>/)
  .reduce(0) { |total, str| total += str.length - 2 }

p garbage_count
