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
  current_dial_position = 50
  count = 0
  File.readlines(filename).each do |line|
    # replace L with - and delete R to get the magnitude of the turn
    turn = line.strip.tr("L", "-").delete("R").to_i
    start_position = current_dial_position

    # Update position first to check if we end at 0
    # -100 % 100 = 0 and 400 % 100 = 0
    current_dial_position = (start_position + turn) % 100
    ends_at_zero = (current_dial_position == 0)

    # How many times did we rotate through 0 during this turn?
    # But we don't count starting at 0 - only crossing through 0 during the rotation
    if turn > 0  # Rotating right
      # add 1 count for each full cycle of 100 clicks
      full_cycles = turn / 100
      count += full_cycles

      # Check if any remaining partial rotation cross 0
      # ignore if we start at 0 or end at 0
      updated_dial_position = turn % 100
      if updated_dial_position > 0 && start_position != 0 && start_position + updated_dial_position >= 100 && !ends_at_zero
        count += 1
      end
    else  # Rotating left (negative turn)
      # add 1 count for each full cycle of 100 clicks
      full_cycles = (-turn) / 100
      count += full_cycles

      # Check if any remaining partial rotation cross 0
      # (e.g. -25 % 100 = 75 and -33 % 100 = 67)
      # ignore if we start at 0 or end at 0
      updated_dial_position = (-turn) % 100
      if updated_dial_position > 0 && start_position != 0 && start_position - updated_dial_position < 0 && !ends_at_zero
        count += 1
      end
    end
    # Add 1 count if we end at 0 and all rotations are resolved
    if ends_at_zero
      count += 1
    end
  end
  count
end

if __FILE__ == $0
  puts "Part 1: #{solve_part1("input.txt")}"
  puts "Part 2: #{solve_part2("input.txt")}"
end

