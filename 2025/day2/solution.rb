# Your solution goes here

def solve_part1(filename)
  # 11-22 has two invalid IDs, 11 and 22.
  # 95-115 has one invalid ID, 99.
  # 998-1012 has one invalid ID, 1010.
  # 1188511880-1188511890 has one invalid ID, 1188511885.
  # 222220-222224 has one invalid ID, 222222.
  # 1698522-1698528 contains no invalid IDs.
  # 446443-446449 has one invalid ID, 446446.
  # 38593856-38593862 has one invalid ID, 38593859.
  # The rest of the ranges contain no invalid IDs.
  # Adding up all the invalid IDs produces 1227775554.

  invalid_ids = 0
  File.readlines(filename).each do |line|
    range = line.strip.split("-").map(&:to_i)
    p range
  end
  invalid_ids
end

def solve_part2(filename)
  # TODO
end

if __FILE__ == $0
  puts "Part 1: #{solve_part1('input.txt')}"
  puts "Part 2: #{solve_part2('input.txt')}"
end
