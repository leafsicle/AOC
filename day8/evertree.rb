#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
# mandated comment
class Lookout
  def initialize(data)
    @data = data
    @tree_grid = drone_footage(@data)
    count_trees @tree_grid
  end

  def drone_footage(input)
    forest_grid = []
    input.readlines.map(&:chomp).each_with_index do |line, _index|
      playbook = line.split('').map(&:to_i)
      forest_grid << playbook
    end
    forest_grid
  end
end

def count_trees(forest)
  tall_tree_count = 0
  # unless index !=0 && index != forest_grid.length - 1 && line_index != 0 && line_index != line.length - 1
  p forest
  forest.each_with_index do |tree_row, index|
    if index.zero? || index == forest.length - 1
      tall_tree_count += tree_row.length
    else
      tree_row.each_with_index do |_tree, tree_row_index|
        tall_tree_count += 1 if tree_row_index.zero? || tree_row_index == tree_row.length - 1
      end
    end
  end
  p tall_tree_count
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

def main
  file_name = prompt_for_txt_file
  file_data = File.open(file_name)
  Lookout.new(file_data)
end
main
