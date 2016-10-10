defmodule Triangle do
  def kind(a, b, c) do
    cond do
      any_not_positive?(a, b, c) -> {:error, "all side lengths must be positive"}
      is_inequal?(a, b, c) -> {:error, "side lengths violate triangle inequality"}
      is_equilateral?(a, b, c) -> {:ok, :equilateral}
      is_isosceles?(a, b, c) -> {:ok, :isosceles}
      true -> {:ok, :scalene}
    end
  end

  def is_inequal?(a, b, c), do: a + b <= c || a + c <= b || b + c <= a

  def any_not_positive?(a, b, c), do: Enum.any?([a, b, c], fn x -> x <= 0 end)

  def is_isosceles?(a, b, c), do: a == b || a == c || b == c

  def is_equilateral?(a, b, c), do: a == b && b == c
end
