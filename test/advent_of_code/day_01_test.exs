defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  test "part1" do
    result = part1()

    assert result
  end

  test "packing_backpacks" do
    input = ["1000", "2000", "", "3000", "", "4000", "5000"]
    result = pack_backpacks(input)
    assert Enum.count(result) == 3
    assert Enum.count(Enum.at(result, 0)) == 2
    assert Enum.count(Enum.at(result, 1)) == 1
    assert Enum.count(Enum.at(result, 2)) == 2
  end

  test "sum_backpacks" do
    input = ["1000", "2000", "", "3000", "", "4000", "5000"] |> pack_backpacks
    result = sum_backpacks(input)
    assert Enum.at(result, 0) == 3000
    assert Enum.at(result, 1) == 3000
    assert Enum.at(result, 2) == 9000
  end

  test "find_biggest" do
    input = ["1000", "2000", "", "3000", "", "4000", "5000"] |> pack_backpacks |> sum_backpacks
    result = find_biggest(input)
    assert result == [{2, 9000}]
  end
end
