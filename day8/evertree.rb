#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'

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

def look_around(forest, row_index, column_index)
  current_height = forest[row_index][column_index]
  row = forest[row_index]
  column = forest.transpose[column_index]
  if (row_index.zero? || column_index.zero?) || row_index == forest.length - 1 || column_index == forest.first.length - 1
    return 1
  end
  return 1 if current_height > row[0...column_index].max # looking left
  return 1 if current_height > row[column_index + 1..-1].max # looking right
  return 1 if current_height > column[0...row_index].max # looking down
  return 1 if current_height > column[row_index + 1..-1].max # looking up

  0
end

def visibility_map(forest)
  forest.length.times.map do |row|
    forest.first.length.times.map do |column|
      look_around(forest, row, column)
    end
  end
end

def scenic_view(trees, i, j)
  current_height = trees[i][j]

  row = trees[i]
  col = trees.transpose[j]
  scores = []
  # Left
  score = 0
  (j - 1).downto(0) do |k|
    score += 1
    break if row[k] >= current_height
  end
  scores << score

  # right
  score = 0
  (j + 1...trees.first.length).each do |k|
    score += 1
    break if row[k] >= current_height
  end
  scores << score

  # above
  score = 0
  (i - 1).downto(0).each do |k|
    score += 1
    break if col[k] >= current_height
  end
  scores << score
  # below
  score = 0
  (i + 1...trees.length).each do |k|
    score += 1
    break if col[k] >= current_height
  end
  scores << score
  scores.inject(:*)
end

def main
  file_contents = File.open(prompt_for_txt_file)
  forest = drone_footage(file_contents)
  p visibility_map(forest).flatten.sum
  return unless ARGV.empty?

  require 'rspec/autorun'
  RSpec.describe 'day8' do
    it 'works with example input' do
      expect(visibility_map(forest)).to eq(
        [
          [1, 1, 1, 1, 1],
          [1, 1, 1, 0, 1],
          [1, 1, 0, 1, 1],
          [1, 0, 1, 0, 1],
          [1, 1, 1, 1, 1]
        ]
      )
    end
    it 'works with example scenic input' do
      expect(scenic_view(forest, 1, 2)).to eq(
        4
      )
      expect(scenic_view(forest, 3, 2)).to eq(
        8
      )
    end
  end
end
main
