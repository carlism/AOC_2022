defmodule AdventOfCode.Day07 do
  @day 7
  @year 2022

  def input() do
    AdventOfCode.Input.get!(@day, @year)
     |> String.split("\n", trim: true)
  end

  def part1() do
    part1(input())
  end

  def part1(input) do
    input |> process
    |> Map.get(:totals)
    |> Enum.filter(fn {_, val} -> val <= 100000 end)
    |> Enum.map(fn {_, val} -> val end)
    |> Enum.sum
      |> IO.inspect(label: "Part 1 Results")
  end

  def part2() do
    part2(input())
  end

  def part2(input) do
    total_space = 70000000
    needed_space = 30000000
    dir_totals = input |> process
    |> Map.get(:totals)
    used_space = Map.get(dir_totals, "/")
    free_space = total_space - used_space
    min_delete = needed_space - free_space
    dir_totals
    |> Enum.filter(fn {_, val} -> val >= min_delete end)
    |> Enum.map(fn {_, val} -> val end)
    |> Enum.sort()
    |> List.first
      |> IO.inspect(label: "Part 2 Results")
  end

  # update totals recurses up the tree updating path totals
  def update_totals(totals_map, path, size_addition)

  # the terminal state
  def update_totals(totals, [], _) do
    totals
  end

  def update_totals(totals, [_ | rest] = path, size) do
    path_str = Enum.join(Enum.reverse(path), "/")
    update_totals(totals, rest, size)
    |> Map.update(path_str, 0, fn total -> total + size end)
  end

  # This process_line handles tracking the path
  def process_line("$ cd "<> newdir, state) do
    case newdir do
    "/" -> state |> Map.put(:path, [newdir])
    ".." -> state |> Map.put(:path, state[:path] |> Enum.drop(1))
    _ -> state |> Map.put(:path, [newdir | state[:path]])
    end
  end

  # This process_line accumulates path totals
  def process_line(line, state) do
    size_info = Regex.run(~r/^(\d+)\s/, line, capture: :all_but_first)
    if size_info != nil do
      Map.update(state, :totals, %{}, fn totals -> 
        update_totals(totals, state.path, String.to_integer(List.first(size_info)))
      end)
    else
      state
    end
  end

  # process traverses the input to process each line in sequence
  def process(input, state \\ %{})

  # The terminal state
  def process([], state) do
    state
  end
  
  def process([line | rest], state) do
    state = process_line(line, state)
    process(rest, state)
  end
end