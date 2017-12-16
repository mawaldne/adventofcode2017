#!/usr/bin/env ruby -w

# To Run
# ./registers.rb input.txt

INSTRUCTION = /(.*) (inc|dec) ([-+]?\d*) if (.*) (.*) ([-+]?\d*)$/
variables = Hash.new(0)

max = 0
ARGF.each_line do |instruction|
  if instruction =~ INSTRUCTION
    var, var2 = $1, $4
    inc_cmd, boolean = $2, $5
    inc_amt, criteria = $3, $6

    inc = "+=" if inc_cmd == 'inc'
    inc = "-=" if inc_cmd == 'dec'

    inst = "variables[var] #{inc} #{inc_amt} if variables[var2] #{boolean} #{criteria}"
    eval(inst)
    p inst

    max = [variables.values.max, max].max
  end
end
p variables.values.max
p max

