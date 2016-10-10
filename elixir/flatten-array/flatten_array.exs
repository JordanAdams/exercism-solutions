defmodule FlattenArray do
  def flatten(list), do: do_flatten(list, [])

  defp do_flatten([], new) do
    Enum.reverse(new)
    |> Enum.filter(&(&1 != nil))
  end

  defp do_flatten([item | rest], new) when is_list(item) do
    do_flatten(item ++ rest, new)
  end

  defp do_flatten([item | rest], new) do
    do_flatten(rest, [item | new])
  end
end
