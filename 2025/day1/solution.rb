def solve_part1(filename)
  diff = 50
  count = 0
  File.readlines(filename).each do |line|
    turn = line.strip.tr("L", "-").delete("R").to_i
    diff += turn
    count += 1 if diff % 100 == 0
  end
  count
end

def solve_part2(filename)
  # TODO
end

if __FILE__ == $0
  puts "Part 1: #{solve_part1("input.txt")}"
  # puts "Part 2: #{solve_part2("input.txt")}"
end
