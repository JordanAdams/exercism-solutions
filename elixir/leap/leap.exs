defmodule Year do
  def leap_year?(year) do
    cond do
      divisible_by?(year, 400) -> true
      divisible_by?(year, 100) -> false
      divisible_by?(year, 4) -> true
      true -> false
    end
  end

  defp divisible_by?(x, y), do: rem(x, y) === 0
end
