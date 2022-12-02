defmodule AdventOfCode.Day03 do
  @day 3
  @year 2022

  def input() do
    AdventOfCode.Input.get!(@day, @year)
  end

  def part1() do
    part1(input() |> String.split("\n"))
  end

  def part1(input) do
    input
      |> IO.inspect(label: "Part 1 Results")
  end

  def part2() do
    part2(input() |> String.split("\n"))
  end

  def part2(input) do
    input 
      |> IO.inspect(label: "Part 2 Results")
  end
end