#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
# mandated comment
class RoshamBowMaker
  def initialize(data)
    @data = parse(data)
  end

  def parse(input)
    def win?(user, opponent)
      conditions = {
        'Rock' => 'Scissors',
        'Paper' => 'Rock',
        'Scissors' => 'Paper'
      }
      if conditions[user] == opponent
        puts 'You win!'
      elsif user == opponent
        puts 'Its a draw!'
      else
        puts 'Opponent wins!'
      end
    end

    def convert(user, opponent)
      opponent_guide = {
        'A' => 'Rock',
        'B' => 'Paper',
        'C' => 'Scissors'
      }
      converted_user_guide = {
        'X' => 'Rock',
        'Y' => 'Paper',
        'Z' => 'Scissors'
      }
      # p opponent_guide[opponent]
      # p converted_user_guide[user]
      win?(converted_user_guide[user], opponent_guide[opponent])
    end
    user_score = 0

    input.readlines.map(&:chomp).each_with_index do |line, _index|
      # p line
      opponent_choice = line.split(' ')[0]
      user_choice = line.split(' ')[1]
      convert user_choice, opponent_choice
      # popponent_guide[opponent_choice]
      # use the opponent guide to get the "correct" choice
      # I

      # p "#{win? 'Rock', 'Scissors'}"
    end
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
  RoshamBowMaker.new(file_data)
end
main
