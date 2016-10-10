defmodule ListOps do
  def count(l), do: reduce(l, 0, fn (_, acc) -> acc + 1 end)

  def reverse(l), do: reduce(l, [], &([&1 | &2]))

  def map(l, f), do: reverse(l) |> reduce([], &([f.(&1) | &2]))

  def filter(l, f) do
    reverse(l)
    |> reduce([], fn (item, acc) ->
      if f.(item), do: [item | acc], else: acc
    end)
  end

  def reduce(l, acc, f), do: do_reduce(l, acc, f)
  defp do_reduce([], acc, _), do: acc
  defp do_reduce([item | rest], acc, f), do: do_reduce(rest, f.(item, acc), f)

  def append(a, b) do
    reverse(a)
    |> reduce(b, &([&1 | &2]))
  end

  def concat(ll), do: reduce(ll, [], &append(&2, &1))
end
