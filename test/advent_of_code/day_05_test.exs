defmodule AdventOfCode.Day05Test do
  use ExUnit.Case

  import AdventOfCode.Day05

  def test_input() do
    ["    [D]    ",
     "[N] [C]    ",
     "[Z] [M] [P]",
     " 1   2   3 ",
     "",
     "move 1 from 2 to 1",
     "move 3 from 1 to 3",
     "move 2 from 2 to 1",
     "move 1 from 1 to 2"]
  end

  test "read_container_lines" do
    result = test_input() 
    |> read_container()
    # |> IO.inspect(label: "container")

    assert Enum.count(result) == 3
    assert Enum.at(result, 1) == ["D", "C", "M"]
  end

  test "load container" do
    AdventOfCode.Day05.Container.start_link(test_input() |> read_container())
    assert AdventOfCode.Day05.Container.get_stack(1) == ["D", "C", "M"]
  end

  test "move an item" do
    AdventOfCode.Day05.Container.start_link(test_input() |> read_container())
    AdventOfCode.Day05.Container.move(from: 2, to: 3, count: 1)
    assert AdventOfCode.Day05.Container.get_stack(1) == ["C", "M"]
    assert AdventOfCode.Day05.Container.get_stack(2) == ["D", "P"]
  end

  test "move two items" do
    AdventOfCode.Day05.Container.start_link(test_input() |> read_container())
    AdventOfCode.Day05.Container.move(from: 2, to: 3, count: 2)
    assert AdventOfCode.Day05.Container.get_stack(1) == ["M"]
    assert AdventOfCode.Day05.Container.get_stack(2) == ["C", "D", "P"]
  end

  test "retrieve top items" do
    AdventOfCode.Day05.Container.start_link(test_input() |> read_container())
    assert AdventOfCode.Day05.Container.get_top() == ["N", "D", "P"]
    AdventOfCode.Day05.Container.move(from: 2, to: 3, count: 1)
    assert AdventOfCode.Day05.Container.get_top() == ["N", "C", "D"]
  end

  test "read_move_lines" do
    result = test_input() 
    |> read_moves()
    # |> IO.inspect(label: "moves")

    assert Enum.count(result) == 4
    assert Enum.at(result, 1) == [3, 1, 3]
  end

  test "part1" do
    result = test_input() |> part1()
    assert result == "CMZ"
  end

  test "part2" do
    result = test_input() |> part2()

    assert result == "MCD"
  end
end
