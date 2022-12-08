defmodule AdventOfCode.Day08Test do
  use ExUnit.Case

  import AdventOfCode.Day08

  def test_input do
    """
    30373
    25512
    65332
    33549
    35390
    """
    |> String.split("\n", trim: true)
  end

  test "parse_trees" do
    result = parse(test_input())

    assert result.rows == 5
    assert result.cols == 5
    assert result.grid[{3,3}] == 4
  end

  test "visible edge count" do
    data = parse(test_input())
    result = visible_edges(data)

    assert result == 16
  end
  
  test "part1" do
    result = part1(test_input())

    assert result == 21
  end

  test "part2" do
    result = part2(test_input())

    assert result == 8
  end
end
