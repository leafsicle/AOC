def solve_part1(filename)
  sheet = []
  File.readlines(filename).each do |line|
    ranges = line.strip.split(" ")
    sheet << ranges
  end

  # Remove empty lines
  sheet.reject! { |row| row.empty? }

  # Last row contains operators
  operators = sheet.pop

  # Convert all numbers to integers
  sheet.map! { |row| row.map(&:to_i) }

  # Process each column
  cumulative_result = 0

  (0...operators.length).each do |col_idx|
    # Get all numbers in this column
    column_numbers = sheet.map { |row| row[col_idx] }

    # Apply the operator for this column
    result = column_numbers[0]
    (1...column_numbers.length).each do |i|
      if operators[col_idx] == "*"
        result *= column_numbers[i]
      else
        result += column_numbers[i]
      end
    end

    cumulative_result += result
  end

  cumulative_result
end

def solve_part2(filename)
  # TODO
end

if __FILE__ == $0
  puts "Part 1: #{solve_part1("input.txt")}"
  puts "Part 2: #{solve_part2("input.txt")}"
end
