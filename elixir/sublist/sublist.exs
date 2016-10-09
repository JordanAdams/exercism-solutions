defmodule Sublist do
  def compare(a, b) do
    cond do
      a === b  -> :equal
      a === [] -> :sublist
      b === [] -> :superlist
      contains?(b, a) -> :sublist
      contains?(a, b) -> :superlist
      true    -> :unequal
    end
  end

  def contains?(a, b) do
    length = Enum.count(b)

    cond do
      length > Enum.count(a) -> false
      Enum.take(a, length) === b -> true
      true -> contains?(tl(a), b)
    end
  end
end
