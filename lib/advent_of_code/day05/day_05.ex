defmodule AdventOfCode.Day05 do
  @day 5
  @year 2022

  def input() do
    AdventOfCode.Input.get!(@day, @year)
  end

  def part1() do
    part1(input() |> String.split("\n"))
  end

  def part1(input) do
    AdventOfCode.Day05.Container.start_link(input |> read_container())
    input |> read_moves() |> Enum.each(fn [count, from, to] -> 
      AdventOfCode.Day05.Container.move(from: from, to: to, count: count)
    end)
    AdventOfCode.Day05.Container.get_top
    |> Enum.join()
    # |> IO.inspect(label: "Part 1 Results")
  end

  def part2() do
    part2(input() |> String.split("\n"))
  end

  def part2(input) do
    AdventOfCode.Day05.Container.start_link(input |> read_container())
    input |> read_moves() |> Enum.each(fn [count, from, to] -> 
      AdventOfCode.Day05.Container.shift(from: from, to: to, count: count)
    end)
    AdventOfCode.Day05.Container.get_top
    |> Enum.join()
    # |> IO.inspect(label: "Part 2 Results")
  end

  def read_container(input) do
    input
    |> Enum.take_while(fn line -> String.match?(line, ~r/[\[\]]/) end)
    |> Enum.map(fn line -> 
        Regex.scan(~r/(?:\s{4}|\[(.)\]\s?)/, line, capture: :all_but_first)
      end)
    |> Enum.map(fn matches -> 
      matches |> Enum.with_index() |> Enum.filter(fn 
        {[],_} -> false
        _ -> true
      end)
      |> Enum.map(fn {[item], index} -> {index, item} end)
    end)
    |> List.flatten()
    |> Enum.sort_by(fn {index, _} -> index end)
    |> Enum.chunk_by(fn {index, _} -> index end)
    |> Enum.map(fn tower -> 
      tower
      |> Enum.map(fn {_, item} -> item end)
    end)
  end

  def read_moves(input) do
    input
    |> Enum.drop_while(fn line -> String.length(line) > 0 end)
    |> Enum.filter(fn line -> String.length(line) > 0 end)
    |> Enum.map(fn line -> 
      Regex.scan(~r/(\d+)/, line, capture: :all_but_first)
    end)
    |> Enum.map(fn matches ->
      matches |> Enum.map(&List.first/1) |> Enum.map(&String.to_integer/1)
    end)
  end
end