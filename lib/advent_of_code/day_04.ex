defmodule AdventOfCode.Day04 do
  @day 4
  @year 2022

  def input() do
    AdventOfCode.Input.get!(@day, @year)
  end

  def part1() do
    part1(input() |> String.split("\n") |> Enum.reject(fn x -> x=="" end))
  end

  def part1(input) do
    input
      |> pairs() |> Enum.map(&overlap/1) 
      |> Enum.filter(fn o -> o end)
      |> Enum.count()
      # |> IO.inspect(label: "Part 1 Results")
  end

  def part2() do
    part2(input() |> String.split("\n") |> Enum.reject(fn x -> x=="" end))
  end

  def part2(input) do
    input
      |> pairs() |> Enum.map(&no_overlap/1) 
      |> Enum.reject(fn o -> o end)
      |> Enum.count()
      # |> IO.inspect(label: "Part 2 Results")
  end

  def pairs(input) do
    input
    |> Enum.map(fn row -> 
      row |> String.split(",")
      |> Enum.map(fn area -> 
        limits = area |> String.split("-")
        String.to_integer(List.first(limits))..String.to_integer(List.last(limits))
      end)
    end)
  end

  def overlap([area1, area2]) do
    union_size = MapSet.size(MapSet.union(MapSet.new(area1),MapSet.new(area2)))
    Range.size(area1) == union_size || Range.size(area2) == union_size 
  end

  def no_overlap([area1, area2]) do
    union_size = MapSet.size(MapSet.union(MapSet.new(area1),MapSet.new(area2)))
    Range.size(area1) + Range.size(area2) == union_size 
  end
end