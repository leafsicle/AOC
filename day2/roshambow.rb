#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
# mandated comment
class RoshamBowMaker
  def initialize(data)
    @data = roshambo(data)
  end

  def convert_to_weapon(user, opponent)
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
    [converted_user_guide[user], opponent_guide[opponent]]
  end

  def match_success_score_boost(user, opponent)
    conditions = {
      'Rock' => 'Scissors',
      'Paper' => 'Rock',
      'Scissors' => 'Paper'
    }
    if conditions[user] == opponent
      6
    elsif user == opponent
      3
    else
      0
    end
  end

  def roshambo(input)
    total_score = 0
    input.readlines.map(&:chomp).each_with_index do |line, _index|
      playbook = line.split(' ')
      opponent_choice = playbook[0]
      user_choice = playbook[1]
      weapon_points = %w[X Y Z].index(user_choice) + 1
      user_weapon, opponent_weapon = convert_to_weapon(user_choice, opponent_choice)
      outcome = match_success_score_boost(user_weapon, opponent_weapon)
      # p "Round #{_index + 1}: #{user_weapon} vs #{opponent_weapon} = #{outcome} points"
      total_score += outcome + weapon_points
    end
    p total_score
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
