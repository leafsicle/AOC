def solve_part1(filename)
  lines = File.readlines(filename, chomp: true)
  safe_reports = 0
  lines.each do |line|
    # split the line into an array of integers
    lane = line.split(" ").map { |l| l.to_i }
    # check if the levels are either all increasing or all decreasing
    next unless sorted?(lane)
    # check if any two adjacent levels differ by at least one and at most three
    lane.each_with_index { |x, i|
      # skip the last comparison as there is no next entry
      if i != lane.length - 1
        # check if the difference between the two adjacent levels is between 1 and 3
        variance = (x - lane[i + 1]).abs
        # if the difference is between 1 and 3 for any two adjacent levels, the report is not safe
        break unless (1..3).cover?(variance)
      else
        safe_reports += 1
      end
    }
  end
  safe_reports
end

def solve_part2(filename)
  nil
end

def sorted?(lane)
  lane == lane.sort || lane == lane.sort.reverse
end

if __FILE__ == $0
  puts "Part 1: #{solve_part1("input.txt")}"
  # puts "Part 2: #{solve_part2("input.txt")}"
end
