#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'

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
      if viewport.size < limit
        viewport << signal
      else
        viewport.shift
        viewport << signal
      end
      return index + 1 if viewport == viewport.uniq && viewport.size == limit
    end
  end

  def solve_part_1
    p "part 1: #{start_of_packet_detector(@data, 4)}"
  end

  def solve_part_2
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
  file_choice = gets.chomp

  if file_choice.to_i > file_list.length
    $stdout.clear_screen
    file_choice = nil
    puts 'Invalid choice. Try again.'
    exit 1
  else
    file_name = file_list[file_choice.to_i - 1]
  end

  file_data = File.open(file_name)
  solver = Tuner.new(file_data)
  solver.solve_part_1
  solver.solve_part_2
end
main
