def solve_part1(filename)
  lines = File.readlines(filename, chomp: true)
  left = []
  right = []
  lines.each do |line|
    l, r = line.split("   ")
    left << l
    right << r
  end
  left.sort!
  right.sort!
  dist = 0
  left.each_with_index { |num, i| dist += (right[i].to_i - num.to_i).abs }
  dist
end

def solve_part2(filename)
  lines = File.readlines(filename, chomp: true)
  left, right, l_arr, right_arr = {}, {}, [], []
  lines.each do |line|
    l, r = line.split("   ")
    l_arr << l.to_i
    right_arr << r.to_i
    left[l.to_i] = 0 unless left.key?(l.to_i)
    right[r.to_i] = 0 unless right.key?(r.to_i)
    left[l.to_i] += 1
    right[r.to_i] += 1
  end
  sum = 0
  l_arr.each do |num|
    sum += num * (right[num] || 0)
  end
  sum
end

if __FILE__ == $0
  puts "Part 1: #{solve_part1("input.txt")}"
  puts "Part 2: #{solve_part2("input.txt")}"
end
