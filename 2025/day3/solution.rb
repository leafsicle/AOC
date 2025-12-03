def solve_part1(filename)
  max_joltage = 0
  File.read(filename).split("\n").each do |battery_pack|
    digits = battery_pack.chars.map(&:to_i)
    current_max = 0

    # For each position i (first digit), check all positions j > i (second digit)
    digits.each_with_index do |first_digit, i|
      # Iterate through all remaining digits after position i
      digits[(i + 1)..].each do |second_digit|
        two_digit_number = first_digit * 10 + second_digit
        current_max = [current_max, two_digit_number].max
      end
    end

    max_joltage += current_max
  end
  max_joltage
end

def solve_part2(filename)
  # TODO
end

if __FILE__ == $0
  puts "Part 1: #{solve_part1("input.txt")}"
  puts "Part 2: #{solve_part2("input.txt")}"
end
