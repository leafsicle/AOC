require "minitest/autorun"
require_relative "./solution"

class SolutionTest < Minitest::Test
  def test_part1_with_example
    skip assert_equal 11, solve_part1("example.txt")
  end

  def test_part2_with_example
    assert_equal 31, solve_part2("example.txt")
  end
end
