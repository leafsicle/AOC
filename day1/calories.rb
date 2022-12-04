#!/usr/bin/env ruby
file = File.open('raw_calories.txt').readlines
# file = File.open('sample.txt').readlines
elves_grouped = []
high_cal = 0
elf_cal_value = 0
file.each do |line|
  if line == "\n"
    if elf_cal_value > high_cal
      high_cal = elf_cal_value
    end
      elves_grouped << elf_cal_value
      elf_cal_value = 0
  else
    elf_cal_value += line.to_i
  end
end
puts "part one:"
puts high_cal
puts "part two:"
puts elves_grouped.sort.last(3).sum
