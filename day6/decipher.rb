#!/usr/bin/env ruby
# frozen_string_literal: true

class Tuner
  def initialize(data)
    @data = parse(data)
  end

  def parse(input)
    input.map(&:chars).flatten # may need the flatten
  end

  def start_of_packet_detector(signals)
    viewport = []
    signals.each_with_index do |signal, _index|
      if viewport.size < 4
        viewport << signal
      else
        viewport.shift
        viewport << signal
      end
      return _index + 1 if viewport == viewport.uniq && viewport.size == 4
    end
  end

  def solve1
    p start_of_packet_detector @data
  end
end

solver = Tuner.new(ARGF.readlines)
solver.solve1
