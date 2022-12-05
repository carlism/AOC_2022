defmodule AdventOfCode.Day04Test do
  use ExUnit.Case

  import AdventOfCode.Day04

  def test_input() do
    ["2-4,6-8",
     "2-3,4-5",
     "5-7,7-9",
     "2-8,3-7",
     "6-6,4-6",
     "2-6,4-8"]
  end

  test "part1" do
    result = part1(test_input())

    assert result == 2
  end


  test "pairs" do
    result = pairs(test_input())

    assert Enum.count(result) == 6
    assert List.first(result) == [2..4, 6..8]
  end

  test "full_overlap" do
    pairs = test_input() |> pairs()
    assert Enum.map(pairs, &overlap/1) == [false, false, false, true, true, false]
  end
end
