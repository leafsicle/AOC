#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
# mandated comment
class Lookout
  def initialize(data)
    @data = data
    @tree_grid = drone_footage(@data)
    part1 = count_trees @tree_grid
    p "Part 1: Visible Trees #{part1}"
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
  forest.each_with_index do |tree_row, index|
    # if the row is the first or last row, count all trees else +2 for the e
    perimeter_trees = index.zero? || index == forest.length - 1 ? tree_row.length : 2
    row_visible_trees = 0
    column_visible_trees = 0
    p tree_row
    tree_row.each_with_index do |tree, tree_row_idx|
      left_hedge_height = tree_row.first
      right_hedge_height = tree_row.last
      next if tree_row_idx.zero? || tree_row_idx == tree_row.length - 1 # if the tree is on the left or right edge, next

      if left_hedge_height < tree
        # if the left edge is lower than the tree, it is visible
        row_visible_trees += 1 # a
        # left_hedge_height = tree # set the left edge to the height of the tree as the _next-tallest_ tree
        p "Left Hedge #{left_hedge_height} is lower than tree: #{tree}"
        next
      end
      p "compared left hedge #{left_hedge_height} to tree #{tree}"
    end
    tall_tree_count += perimeter_trees
  end
  p "Tall Tree Count: #{tall_tree_count}"
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
