require "minitest/autorun"
require_relative "./solution"

class SolutionTest < Minitest::Test
  def test_part1_with_example
    expected = 2
    assert_equal expected, solve_part1("example.txt")
  end

  # def test_part2_with_example
  #   assert_equal expected, solve_part2("example.txt")
  # end
end
