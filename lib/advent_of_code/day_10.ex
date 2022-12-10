defmodule AdventOfCode.Day10 do
  @day 10
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
    |> process()
    |> Enum.drop(19)
    |> Enum.take_every(40)
    |> Enum.map(fn {_,_,signal} -> signal end)
    |> Enum.sum
  end

  def part2() do
    part2(input())
  end

  def part2(input) do
    computed = input |> process()
    IO.puts("")
    0..5 |> Enum.each(fn row ->
      0..39 |> Enum.map(fn col ->
        cycle = (row * 40) + col
        {_cycle,reg,_signal} = computed |> Enum.at(cycle)
        if Enum.member?(reg..(reg+2), (col+1)) do
          "# "
        else
          "  "
        end
      end)
      |> IO.puts
    end)
  end

  def process(input) do
    input
    |> Enum.map_reduce(1, fn
      "noop", reg -> {reg, reg}
      "addx " <> addend, reg ->
        new_reg = reg + String.to_integer(addend)
        {[reg, reg], new_reg}
    end)
    |> then(fn {out, _} -> out end)
    |> List.flatten
    |> Enum.with_index()
    |> Enum.map(fn {reg, cnt} -> {cnt+1, reg, reg*(cnt+1)} end)
  end

end
