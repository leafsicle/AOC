require "minitest/autorun"
require_relative "./solution"

class SolutionTest < Minitest::Test
  def test_part1_with_example
    expected = 1227775554
    assert_equal expected, solve_part1("example.txt")
  end

  def test_part2_with_example
    expected = 4174379265
    assert_equal expected, solve_part2("example.txt")
  end
end
