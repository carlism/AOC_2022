defmodule BasicTest do
  use ExUnit.Case

  test "get input" do
    input = AdventOfCode.Input.get!(1, 2022)
    assert input != nil
    assert String.length(input) > 5
  end
end