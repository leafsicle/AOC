def solve_part1(filename)
  sheet, operators = process_file(filename)
  # Convert all numbers to integers
  sheet.map! { |row| row.map(&:to_i) }

  # Process each column
  cumulative_result = 0

  # since operators are in the last row, we can iterate through the operators count
  (0...operators.length).each do |col_idx|
    # Get all numbers in this column
    column_numbers = sheet.map { |row| row[col_idx] }

    # Apply the operator for this column
    result = operate(column_numbers, operators[col_idx])

    cumulative_result += result
  end

  cumulative_result
end

def process_file(filename)
  sheet = []
  File.readlines(filename).each do |line|
    ranges = line.strip.split(" ")
    sheet << ranges
  end

  sheet.reject! { |row| row.empty? }

  # Last row contains operators
  operators = sheet.pop

  [sheet, operators]
end

def operate(numbers, operator)
  result = numbers[0]
  (1...numbers.length).each do |i|
    if operator == "*"
      result *= numbers[i]
    else
      result += numbers[i]
    end
  end
  result
end

def solve_part2(filename)
  # TODO
end

if __FILE__ == $0
  puts "Part 1: #{solve_part1("input.txt")}"
  puts "Part 2: #{solve_part2("input.txt")}"
end
