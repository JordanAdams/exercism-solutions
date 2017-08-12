defmodule Strain do
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun),
    do: do_keep(list, fun, [])

  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    keep(list, fn x -> !fun.(x) end)
  end

  defp do_keep([], _fun, result),
    do: Enum.reverse(result)

  defp do_keep([h | t], fun, result) do
    case fun.(h) do
      true  -> do_keep(t, fun, [h | result])
      false -> do_keep(t, fun, result)
    end
  end
end
