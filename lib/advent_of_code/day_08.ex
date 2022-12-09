defmodule AdventOfCode.Day08 do
  @day 8
  @year 2022

  def input() do
    AdventOfCode.Input.get!(@day, @year)
     |> String.split("\n", trim: true)
  end

  def part1() do
    part1(input())
  end

  def part1(input) do
    data = input
    |> parse()
    visible_edges(data) + visible_interior(data)
      # |> IO.inspect(label: "Part 1 Results")
  end

  def part2() do
    part2(input())
  end

  def part2(input) do
    data = input
    |> parse()
    score_interior(data)
      # |> IO.inspect(label: "Part 2 Results")
  end

  def score_interior(data) do
    1..(data.rows-2) |> Enum.map(fn row -> 
      1..(data.cols-2) |> Enum.map(fn col -> 
        scenic_score(data, row, col)
      end)
    end)
    |> List.flatten
    |> Enum.max
  end

  def take_until([], _), do: []
  
  def take_until([head | tail], fun) do
    if fun.(head) do
      [head]
    else
      [head | take_until(tail, fun)]
    end
  end
  
  def distance_check(list, height) do
    list 
    |> take_until(fn h -> h >= height end)
    |> Enum.count()
  end
  
  def scenic_score(data, row, col) do
    height = data.grid[{row,col}]
    ((row-1)..0 |> Enum.map(fn r -> data.grid[{r,col}] end) |> distance_check(height)) *
    ((row+1)..(data.rows-1) |> Enum.map(fn r -> data.grid[{r,col}] end) |> distance_check(height)) *
    ((col-1)..0 |> Enum.map(fn c -> data.grid[{row,c}] end) |> distance_check(height)) *
    ((col+1)..(data.cols-1) |> Enum.map(fn c -> data.grid[{row,c}] end) |> distance_check(height))
  end

  def visible_edges(data) do
    data.rows * 2 + (data.cols-2) * 2
  end

  def visible_interior(data) do
    1..(data.rows-2) |> Enum.map(fn row -> 
      1..(data.cols-2) |> Enum.map(fn col -> 
        is_visible(data, row, col)
      end)
    end)
    |> List.flatten
    |> Enum.filter(&(&1))
    |> Enum.count
  end

  def is_visible(data, row, col) do
    height = data.grid[{row,col}]
    [
      0..(row-1) |> Enum.map(fn r -> data.grid[{r,col}] end) |> is_visible(height),
      (row+1)..(data.rows-1) |> Enum.map(fn r -> data.grid[{r,col}] end) |> is_visible(height),
      0..(col-1) |> Enum.map(fn c -> data.grid[{row,c}] end) |> is_visible(height),
      (col+1)..(data.cols-1) |> Enum.map(fn c -> data.grid[{row,c}] end) |> is_visible(height)
    ] |> Enum.any?
  end

  def is_visible(list, height) do
    list |> Enum.all?(fn h -> h < height end)
  end
  
  def parse(data) do
    grid = parse_grid(data)
    %{ 
      grid: grid,
      rows: (Enum.map(grid, fn { {row, _}, _} -> row end) |> Enum.max) + 1,
      cols: (Enum.map(grid, fn { {_, col}, _} -> col end) |> Enum.max) + 1
    }
  end

  def parse_grid(data) do
    data 
    |> Enum.with_index
    |> Enum.map(fn {cols, row} -> 
      cols
      |> String.codepoints
      |> Enum.with_index
      |> Enum.map(fn {height, col} -> 
        {row, col, String.to_integer(height)}
      end)
    end)
    |> List.flatten()
    |> Enum.reduce(%{}, fn {row, col, height}, grid -> 
      grid |> Map.put({row,col}, height)
    end)
  end
end