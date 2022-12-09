defmodule AdventOfCode.DayX do
  @day 0
  @year 2022

  def input() do
    AdventOfCode.Input.get!(@day, @year)
     |> String.split("\n", trim: true)
  end

  def part1() do
    part1(input())
  end

  def part1(input) do
    input
  end

  def part2() do
    part2(input())
  end

  def part2(input) do
    input 
  end
end