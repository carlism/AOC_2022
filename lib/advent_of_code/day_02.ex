defmodule AdventOfCode.Day02 do
  @day 2
  @year 2022

  @loss 0
  @draw 3
  @win 6

  @rock 1
  @paper 2
  @scisors 3

  def input() do
    AdventOfCode.Input.get!(@day, @year)
  end

  def part1() do
    part1(input() |> String.split("\n"))
  end

  def part1(input) do
    input 
      |> Enum.map(&String.split/1)
      |> Enum.map(&rps/1)
      |> Enum.sum
      # |> IO.inspect(label: "Part 1 Results")
  end

  def part2() do
    part2(input() |> String.split("\n"))
  end

  def part2(input) do
    input 
      |> Enum.map(&String.split/1)
      |> Enum.map(&rpr/1)
      |> Enum.sum
      # |> IO.inspect(label: "Part 2 Results")
  end

  def rps(["A", "X"]), do: @rock + @draw
  def rps(["B", "X"]), do: @rock + @loss
  def rps(["C", "X"]), do: @rock + @win

  def rps(["A", "Y"]), do: @paper + @win
  def rps(["B", "Y"]), do: @paper + @draw
  def rps(["C", "Y"]), do: @paper + @loss

  def rps(["A", "Z"]), do: @scisors + @loss
  def rps(["B", "Z"]), do: @scisors + @win
  def rps(["C", "Z"]), do: @scisors + @draw

  def rps([]), do: 0

  def rpr(["A", "X"]), do: @scisors + @loss
  def rpr(["B", "X"]), do: @rock + @loss
  def rpr(["C", "X"]), do: @paper + @loss

  def rpr(["A", "Y"]), do: @rock + @draw
  def rpr(["B", "Y"]), do: @paper + @draw
  def rpr(["C", "Y"]), do: @scisors + @draw

  def rpr(["A", "Z"]), do: @paper + @win
  def rpr(["B", "Z"]), do: @scisors + @win
  def rpr(["C", "Z"]), do: @rock + @win

  def rpr([]), do: 0
end