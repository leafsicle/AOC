#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
# mandated comment
class RoshamBowMaker
  def initialize(data)
    @data = data
    roshambo(@data)
  end

  def convert_user_weapon(user)
    converted_user_guide = {
      'X' => 'Rock',
      'Y' => 'Paper',
      'Z' => 'Scissors'
    }
    converted_user_guide[user]
  end

  def convert_opponent_weapon(opponent)
    opponent_guide = {
      'A' => 'Rock',
      'B' => 'Paper',
      'C' => 'Scissors'
    }
    opponent_guide[opponent]
  end

  # def convert_to_weapon2(choice)
  #   guide = choice.match?(/[A-C]/) ? ('Rock') : 'Paper'
  # end
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

  def map_intent_to_choice(opp_choice, intent)
    opp_weapon = convert_opponent_weapon(opp_choice)
    conditions = {
      'Rock' => 'Scissors',
      'Paper' => 'Rock',
      'Scissors' => 'Paper'
    }
    if intent == 'Y' # intent is to Tie
      opp_weapon
    elsif intent == 'Z' # intent is to win
      conditions.fetch(conditions.fetch(opp_weapon))
    elsif intent == 'X' # intent is to lose
      conditions[opp_weapon]
    end
  end

  def roshambo(input)
    score_part1 = 0
    score_part2 = 0
    input.readlines.map(&:chomp).each_with_index do |line, _index|
      playbook = line.split(' ')
      opponent_choice = playbook[0]
      user_choice = playbook[1]
      weapon_points = %w[X Y Z].index(user_choice) + 1
      # part 1
      user_weapon = convert_user_weapon(user_choice)
      opponent_weapon = convert_opponent_weapon(opponent_choice)
      outcome = match_success_score_boost(user_weapon, opponent_weapon)
      score_part1 += outcome + weapon_points

      # part 2
      intended_outcome = playbook[1]
      intended_choice = map_intent_to_choice(opponent_choice, intended_outcome)
      part2_outcome_score = match_success_score_boost(intended_choice, opponent_weapon)
      # p "part2_outcome_score: #{part2_outcome_score} points for a #{intended_choice} vs #{opponent_weapon}"
      weapon_points2 = %w[Rock Paper Scissors].index(intended_choice) + 1
      p intended_choice
      round_score = part2_outcome_score + weapon_points2
      score_part2 += round_score
    end
    puts "part 1: #{score_part1}"
    puts "part 2: #{score_part2}"
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
