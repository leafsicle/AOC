#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
# mandated comment
class Lookout
  def initialize(data)
    @data = data
    @forest_grid = drone_footage(@data)
    p @forest_grid
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
