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
      |> Enum.filter(fn line -> byte_size(line) != 0 end)
      |> Enum.map(fn line ->  
        line |> compartments |> shared |> priority
        end)
      |> Enum.sum
      # |> IO.inspect(label: "Part 1 Results")
  end

  def part2() do
    part2(input() |> String.split("\n"))
  end

  def part2(input) do
    input 
      |> Enum.filter(fn line -> byte_size(line) != 0 end)
      |> Enum.chunk_every(3)
      |> Enum.map(&find_common/1)
      |> Enum.map(&MapSet.to_list/1)
      |> Enum.map(&priority/1)
      |> Enum.sum
      # |> IO.inspect(label: "Part 2 Results")
  end

  def compartments(sack) do
    String.split_at(sack, sack 
      |> String.length 
      |> Integer.floor_div(2))
  end

  def shared(input) do 
    MapSet.intersection(
      input |> elem(0) |> String.codepoints |> MapSet.new,
      input |> elem(1) |> String.codepoints |> MapSet.new
    )
    |> MapSet.to_list
  end

  def find_common([first | rest]) when rest == [] do
    first |> String.codepoints |> MapSet.new()
  end

  def find_common([first | rest]) do
    first |> String.codepoints |> MapSet.new()
      |> MapSet.intersection(find_common(rest))
  end

  def priority(input) do   
    input |> List.first
      |> String.to_charlist |> List.first
      |> priority_value
  end

  def priority_value(char) when char in ?a..?z, do: char-96
  def priority_value(char) when char in ?A..?Z, do: char-64+26
end