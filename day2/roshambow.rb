#!/usr/bin/env ruby
# frozen_string_literal: true

t1 = Process.clock_gettime(Process::CLOCK_MONOTONIC)

opponent_guide = {
  A: [:Y, 1], # rock, scissors, worth
  B: [:Z, 2],
  C: [:X, 3]
}

file = File.open('sample.txt')
file.readlines.map(&:chomp).each do |line|
  opponent_choice = line.split(' ')[0].to_sym
  user_choice = line.split(' ')[1].to_sym
  # based on the opponent's choice, we can determine what the user should play
  p opponent_guide[opponent_choice][0] == user_choice ? 'yes' : 'no'
end
t2 = Process.clock_gettime(Process::CLOCK_MONOTONIC)

#   # (r:1, p:2, s:3)
#   # (L:0, D:3, W:6).

# rd1: A Y (8= 2+ 6) as A=Rock = 2 v P
# This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
# rd2: B X (1 = 1+ 0)
# In the second round, your opponent will choose Paper (B), and you should choose Rock (X).
# results in loss for self with a score of 1 (1 + 0).
# rd3: C Z (6 = 3+ 3)
# The third round is a draw with both players choosing Scissors, giving you a score of 3 + 3 = 6.
# example total score of 15 (8 + 1 + 6)
# What would your total score be if everything goes exactly according to your strategy guide?
delta = t2 - t1
delta_in_milliseconds = delta * 1000.0000000
p "Time elapsed #{delta_in_milliseconds} milliseconds"
