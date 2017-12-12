#!/usr/bin/env ruby -w

# To Run
# ./recursive_circus.rb input.txt

SUPPORTING_PROGRAM = /(.*)\((\d*)\) -> (.*)$/

children = []
parents = []

ARGF.each_line do |program|
  if program =~ SUPPORTING_PROGRAM
    parents << $1.strip
    children += $3.gsub(',','').split
  end
end

p parents - children

