defmodule AdventOfCode.Day05.Container do
  use GenServer

  # public interface
  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def get_stack(num) do
    GenServer.call(__MODULE__, {:get_stack, num})
  end

  def get_top() do
    GenServer.call(__MODULE__, :get_top)
  end

  def move(from: from, to: to, count: count) do
    1..count |> Enum.each(fn _index -> 
      GenServer.call(__MODULE__, {:move, from-1, to-1})
    end)
  end

  def shift(from: from, to: to, count: count) do
    GenServer.call(__MODULE__, {:shift, from-1, to-1, count})
  end

  def init(args) do
    {:ok, args}
  end

  def handle_call({:get_stack, stack}, _from, state) do
    {:reply, Enum.at(state, stack), state}
  end

  def handle_call({:move, from, to}, _from, state) do
    [popped | from_stack] = Enum.at(state, from)
    {:reply, popped, state |> List.replace_at(from, from_stack) |> List.replace_at(to, [popped | Enum.at(state, to)])}
  end

  def handle_call({:shift, from, to, count}, _from, state) do
    popped = Enum.take(Enum.at(state, from), count)
    from_stack = Enum.drop(Enum.at(state, from), count)
    to_stack = [popped | Enum.at(state, to)] |> List.flatten
    {:reply, popped, state |> List.replace_at(from, from_stack) |> List.replace_at(to, to_stack)}
  end

  def handle_call(:get_top, _from, state) do
    {:reply, Enum.map(state, &List.first/1), state}
  end
end