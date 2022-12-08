defmodule AdventOfCode.Day06 do
  @day 6
  @year 2022

  def input() do
    AdventOfCode.Input.get!(@day, @year)
  end

  def part1() do
    part1(input())
  end

  def part1(input) do
    input |> detect_unique
  end

  def detect_unique(input, len \\ 4) do
    (0..String.length(input)
    |> Enum.take_while(fn index -> 
      input |> String.slice(index..(index+len-1)) |> detect_start
    end)
    |> Enum.count) + len
  end

  def part2() do
    part2(input())
  end

  def part2(input) do
    input |> detect_unique(14)
  end

  def detect_start(input) do
    input |> String.to_charlist |> Enum.sort
    |> Enum.chunk_by(&(&1)) 
    |> Enum.map(&Enum.count/1)
    |> Enum.map(&(&1>1))
    |> Enum.any?
  end

end