defmodule SumOfMultiples do
  def to(limit, multiples) do
    Enum.filter(1..(limit-1), fn n -> is_multiple_of?(n, multiples) end)
    |> Enum.sum
  end

  defp is_multiple_of?(number, multiples) when is_list(multiples) do
    Enum.any?(multiples, fn m -> is_multiple_of?(number, m) end)
  end

  defp is_multiple_of?(number, multiple), do: rem(number, multiple) == 0
end
