#!/usr/bin/env ruby
# frozen_string_literal: true

# Class for solving the problem
class Tuner
  def initialize(data)
    @data = parse(data)[0]
  end

  def parse(input)
    input.map do |line|
      line.chars
    end
  end

  def solve1
    p @data
  end
end

solver = Tuner.new(ARGF.readlines)
solver.solve1
