def solve_part1(filename)
  safe_reports = 0
  lines = File.readlines(filename, chomp: true)
  lines.each do |line|
    report = line.split(" ").map { |l| l.to_i }
    safe_reports += 1 if safe_report?(report)
  end
  safe_reports
end

def solve_part2(filename)
  safe_reports = 0
  lines = File.readlines(filename, chomp: true)
  lines.each do |line|
    report = line.split(" ").map { |l| l.to_i }

    # First check if it's already safe
    if safe_report?(report)
      safe_reports += 1
      next
    end

    # Try removing each level one at a time
    found_safe = false
    report.each_with_index do |_level, index|
      # Create a new array without the element at this index
      modified_report = report[0...index] + report[(index + 1)..]

      # Check if this modified report is safe
      if safe_report?(modified_report)
        found_safe = true
        break
      end
    end

    safe_reports += 1 if found_safe
  end
  safe_reports
end

def safe_report?(report)
  # Check if sorted (increasing or decreasing)
  return false unless sorted?(report)

  # Check if all adjacent differences are between 1 and 3
  report.each_with_index do |level, index|
    next if index == report.length - 1
    variance = (level - report[index + 1]).abs
    return false unless (1..3).cover?(variance)
  end

  true
end

def sorted?(lane)
  lane == lane.sort || lane == lane.sort.reverse
end

if __FILE__ == $0
  puts "Part 1: #{solve_part1("input.txt")}"
  puts "Part 2: #{solve_part2("input.txt")}"
end
