defmodule AdventOfCode.Day09 do
  @day 9
  @year 2022

  def move_tail({{hx,hy},{tx,ty}}) do
    if abs(hy-ty) <= 1 and abs(hx-tx) <= 1 do
      {tx,ty}
    else
      new_tx = case hx-tx do
        x when x > 0 -> tx+1
        x when x < 0 -> tx-1
        _ -> tx
      end
      new_ty = case hy-ty do
        y when y > 0 -> ty+1
        y when y < 0 -> ty-1
        _ -> ty
      end
      {new_tx, new_ty}
    end
  end

  def move(direction, {{hx,hy},{tx,ty}}) do
    new_head = move_head(direction, {hx,hy})
    {new_head,move_tail({new_head,{tx,ty}})}
  end

  def move_head("U", {hx,hy}), do: {hx,hy+1}
  def move_head("D", {hx,hy}), do: {hx,hy-1}
  def move_head("L", {hx,hy}), do: {hx-1,hy}
  def move_head("R", {hx,hy}), do: {hx+1,hy}

  def expand_move([move, count]) do
    String.duplicate(move, count) |> String.codepoints()
  end

  def input() do
    AdventOfCode.Input.get!(@day, @year)
     |> String.split("\n", trim: true)
  end

  def part1() do
    part1(input())
  end

  def part1(input) do
    input
    |> Enum.map(fn line -> line
      |> String.split()
      |> then(fn [m,c] -> [m,String.to_integer(c)] end)
      |> expand_move()
    end)
    |> List.flatten()
    |> Enum.map_reduce({{0,0},{0,0}}, fn m, last ->
      next = move(m, last)
      {next, next}
    end)
    |> tuple_first()
    |> Enum.map(fn {_,tail} -> tail end)
    |> Enum.uniq |> Enum.count
  end


  def tuple_first({result,_}), do: result

  def part2() do
    part2(input())
  end

  def part2(input) do
    input
    |> Enum.map(fn line -> line
      |> String.split()
      |> then(fn [m,c] -> [m,String.to_integer(c)] end)
      |> expand_move()
    end)
    |> List.flatten()
    |> Enum.map_reduce(Tuple.duplicate({0,0},10), fn m, string ->

      [head | rest] = string |> Tuple.to_list
      next_head = move_head(m, head)
      next_string = [next_head | rest
        |> Enum.map_reduce(next_head, fn knot, last_knot ->

          next_knot = move_tail({last_knot, knot})
          { next_knot, next_knot }
        end)
        |> tuple_first()
      ] |> List.to_tuple
      {next_string, next_string}
    end)
    |> tuple_first()

    |> Enum.map(fn string -> string |> Tuple.to_list() |> List.last() end)
    |> Enum.uniq |> Enum.count
  end
end
