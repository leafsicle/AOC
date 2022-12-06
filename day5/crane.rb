#!/usr/bin/env ruby
# frozen_string_literal: true

def fix_containers(container_yard)
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
  # transpose the array and reverse the stacks so they are "upright" in the stack
  plumb_stack =
    racked_containers.transpose.map(&:reverse)
  # finally removing the placeholder values from the stack strings
  plumb_stack.each do |stack|
    stack.filter { _1 == '_' }.each { stack.delete('_') }
  end
end

def instruction_processor(instructions)
  instructions.split("\n").map do |instruction|
    instruction.split(' ').select { _1.match?(/\d/) }.map(&:to_i)
  end
end

def move_container(plumb_stack, qty, from, to)
  qty.times do
    plumb_stack[to - 1] << plumb_stack[from - 1].pop
  end
  plumb_stack
end

def crate_mover_9001(plumb_stack, instruction_booklet)
  instruction_booklet.each_with_index do |line, index|
    qty, from, to = line
    puts "Step #{index + 1}: move #{qty} containers from index #{from - 1} to index #{to - 1}"
    bucket = plumb_stack[from - 1].pop(qty)
    p "Bucket: #{bucket}"
    # move the contents of bucket to the destination stack
    plumb_stack[to - 1].concat(bucket)
    p plumb_stack
  end
end

def top_container(plumb_stack)
  quick_containers = []
  plumb_stack.map do |connex|
    quick_containers << connex.join('').slice(-1)
  end
  p quick_containers.join('')
end
# Separates the containers & instructions for easy use
container_yard, instructions = File.read('input.txt').split("\n\n\n")
# part 1
plumb_stack = fix_containers(container_yard)
instructions_array = instruction_processor(instructions)
# top_container plumb_stack # decomment for answer to part 1
crate_mover_9001(plumb_stack, instructions_array)
top_container plumb_stack # decomment for answer to part 1
