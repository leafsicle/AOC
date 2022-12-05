#!/usr/bin/env ruby
# frozen_string_literal: true

container_yard, instructions = File.read('sample.txt').split("\n\n") # read the file
# but also separates the instructions for easy use
crooked_stack = container_yard.split("\n")
crooked_stack.pop # remove the last empty line
racked_containers = []
crooked_stack.map do |stack|
  aligned = stack
            .gsub(/([[:blank:]]{4})/, '_ ') # sub 4 spaces with _ => a blank space from the doc
            .gsub(/([[:blank:]]{3})/, '_ ') # sub 3 spaces with _ => a blank from the document
            .gsub(/([[:blank:]]|[^\w])/, '') # sub all spaces and non-word characters with nothing
  # retain the '_' and the before we dump the contents onto its side
  # if the stack is empty, then skip it
  aligned.empty? ? next : racked_containers << (aligned.split(''))
end
plumb_stack =
  racked_containers.transpose.map(&:reverse)
# transpose the array and reverse the stacks so they are "upright" in the stack
plumb_stack.each do |stack|
  stack.filter { _1 == '_' }.each { stack.delete('_') }
end
p plumb_stack
