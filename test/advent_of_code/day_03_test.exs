defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  def test_input() do 
  ["vJrwpWtwJgWrhcsFMMfFFhFp",
  "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
  "PmmdzqPrVvPwwTWBwg",
  "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
  "ttgJtRGJQctTZtZT",
  "CrZsJsPPZsGzwwsLwLmpwMDw"]
  end
  
  test "part1" do
    result = part1(test_input())

    assert result == 157
  end

  test "compartments" do
    result = compartments(test_input() |> List.last )

    assert result == {"CrZsJsPPZsGz","wwsLwLmpwMDw"}
  end

  test "shared item" do 
   input = test_input() |> List.last |> compartments

   assert shared(input) ==["s"]
  end

  test "charlist value" do
    assert priority(["a"]) == 1
    assert priority(["z"]) == 26
    assert priority(["A"]) == 27
    assert priority(["Z"]) == 52
  end 

end
