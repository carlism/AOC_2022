defmodule AdventOfCode.Day06Test do
  use ExUnit.Case

  import AdventOfCode.Day06

  @tag :skip
  test "part1" do
    input = ["A Y", "B X", "C Z"]
    result = part1(input)

    assert result == 15
  end

  @tag :skip
  test "part2" do
    input = ["A Y", "B X", "C Z"]
    result = part2(input)

    assert result == 12
  end
end
