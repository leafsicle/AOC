#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'

# trying new approaches!
class Tuner
  def initialize(data)
    @data = parse(data)
  end

  def parse(input)
    input.map(&:chars)[0] # may need the flatten
  end

  def start_of_packet_detector(signals, limit)
    viewport = []
    signals.each_with_index do |signal, index|
      viewport.shift if viewport.size >= limit
      viewport << signal
      return index + 1 if viewport == viewport.uniq && viewport.size == limit
    end
  end

  def solve_part1
    p "part 1: #{start_of_packet_detector(@data, 4)}"
  end

  def solve_part2
    p "part 2: #{start_of_packet_detector(@data, 14)}"
  end
end

def file_list
  Dir.glob('*.txt')
end

def show_files
  catcher = file_list
  catcher.each_with_index do |entry, index|
    puts "#{index + 1}: #{entry}"
  end
end

def main
  show_files
  puts 'Against which file do you want to test your solution?'
  user_choice = gets.chomp

  if user_choice.to_i > file_list.length
    $stdout.clear_screen
    puts 'Invalid choice. Try again.'
    exit 1
  else
    file_name = file_list[user_choice.to_i - 1]
  end

  file_data = File.open(file_name)
  solver = Tuner.new(file_data)
  solver.solve_part1
  solver.solve_part2
end
main
