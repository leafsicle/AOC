#!/usr/bin/env ruby
# frozen_string_literal: true

def file_read(file)
  File.read(file).split("\n")
end

file = file_read('sample.txt')
file.map { |line| p line }
