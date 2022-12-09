defmodule AdventOfCode.Day09Test do
  use ExUnit.Case

  import AdventOfCode.Day09

  def test_input do
    """
    R 4
    U 4
    L 3
    D 1
    R 4
    D 1
    L 5
    R 2
    """
     |> String.split("\n", trim: true)
  end

  
  def test_input2 do
    """
    R 5
    U 8
    L 8
    D 3
    R 17
    D 10
    L 25
    U 20
    """
     |> String.split("\n", trim: true)
  end

  test "move down" do
    assert move("D", {{0,0}, {-1,-1}}) == {{0,-1},{-1,-1}} 
    assert move("D", {{0,0}, {0,-1}}) == {{0,-1},{0,-1}} 
    assert move("D", {{0,0}, {1,-1}}) == {{0,-1},{1,-1}} 
    assert move("D", {{0,0}, {-1,0}}) == {{0,-1},{-1,0}} 
    assert move("D", {{0,0}, {0,0}}) == {{0,-1},{0,0}} 
    assert move("D", {{0,0}, {1,0}}) == {{0,-1},{1,0}} 
    assert move("D", {{0,0}, {-1,1}}) == {{0,-1},{0,0}} 
    assert move("D", {{0,0}, {0,1}}) == {{0,-1},{0,0}} 
    assert move("D", {{0,0}, {1,1}}) == {{0,-1},{0,0}} 
  end

  test "expand move" do
    result = ["R", 4] |> expand_move()
    assert result == ["R","R","R","R"]
  end

  test "list decon" do
    [last|_] = [{{1, 0}, {0, 0}}, {{0, 0}, {0, 0}}]
    assert last == {{1, 0}, {0, 0}}
  end
  
  test "part1" do
    result = part1(test_input())

    assert result == 13
  end

  test "part2" do
    result = part2(test_input())

    assert result == 1
  end

  test "part2.2" do
    result = part2(test_input2())

    assert result == 36
  end
end
