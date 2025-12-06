def solve_part1(filename)
  toggle = true
  # ranges = []
  # dates = []
  File.readlines(filename).each do |line|
    # toggle = !toggle if line == "\n"
    p line == "\n"
    p line.chomp
  end
end

def solve_part2(filename)
  # TODO
end


if __FILE__ == $0
  puts "Part 1: #{solve_part1("day5/input.txt")}"
  puts "Part 2: #{solve_part2("day5/input.txt")}"
end
