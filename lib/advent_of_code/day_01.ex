defmodule AdventOfCode.Day01 do
  def part1() do
    part1(AdventOfCode.Input.get!(1, 2022))
  end

  def part1(input) do
    input |> String.split("\n") |> pack_backpacks() |> sum_backpacks() |> find_biggest()
      # |> IO.inspect(label: "Part 1 Results")
  end

  def part2() do
    part2(AdventOfCode.Input.get!(1, 2022))
  end

  def part2(input) do
    input |> String.split("\n") |> pack_backpacks() |> sum_backpacks() |> find_biggest(3)
      |> Enum.map(fn {_, sum} -> sum end) |> Enum.sum()
      # |> IO.inspect(label: "Part 2 Results")
  end

  def pack_backpacks(input) do
    input |> Enum.chunk_while([], fn
      "", acc -> {:cont, Enum.reverse(acc), []}
      item, acc -> {:cont, [item | acc]}
    end, fn acc ->
      {:cont, Enum.reverse(acc), []}
    end
    )
  end

  def sum_backpacks(input) do
    input |> Enum.map( fn backpack ->
      backpack
      |> Enum.map(&Integer.parse/1)
      |> Enum.map(fn {parsed, _} -> parsed end)
      |> Enum.sum
    end)
  end

  def find_biggest(input, count \\ 1) do
    input
    |> Enum.with_index(fn sum, index -> {index, sum} end)
    |> Enum.sort_by(fn {_, sum} -> sum end)
    |> Enum.take(-count)
  end
end
