#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
# mandated comment

def file_list
  Dir.glob('*.txt')
end

def show_files
  catcher = file_list
  catcher.each_with_index do |entry, index|
    puts "#{index + 1}: #{entry}"
  end
end

def user_prompt
  show_files
  puts 'Against which file do you want to test your solution?'
  gets.chomp
end

def prompt_for_txt_file
  user_choice = user_prompt
  if user_choice.to_i > file_list.length
    $stdout.clear_screen
    puts 'Invalid choice. Try again.'
    exit 1
  else
    file_list[user_choice.to_i - 1]
  end
end

def drone_footage(input)
  forest_grid = []
  input.readlines.map(&:chomp).each_with_index do |line, _index|
    playbook = line.split('').map(&:to_i)
    forest_grid << playbook
  end
  forest_grid
end

def look_around(forest, row, column)
  # outer edge of the forest
  return 1 if (row.zero? || column.zero?) || row == forest.length - 1 || column == forest.first.length - 1

  0
end

def visibility_map(forest)
  forest.length.times.map do |row|
    forest.first.length.times.map do |column|
      look_around(forest, row, column)
    end
  end
end

def main
  file_contents = File.open(prompt_for_txt_file)
  forest = drone_footage(file_contents)
  p visibility_map(forest)
end
main
