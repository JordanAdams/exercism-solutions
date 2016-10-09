defmodule Phone do
  def number(raw) do
    number = String.replace(raw, ~r/[^a-z0-9]/i, "")

    cond do
      contains_alpha?(number) ->
        "0000000000"
      String.length(number) == 10 ->
        number
      String.length(number) == 11 && String.starts_with?(number, "1") ->
        String.slice(number, 1..10)
      true ->
        "0000000000"
    end
  end

  defp contains_alpha?(str), do:

  def area_code(raw) do
    number(raw)
    |> String.slice(0..2)
  end

  def pretty(raw) do
    number(raw)
    |> String.replace(~r/^(.{3})(.{3})(.*)$/, "(\\1) \\2-\\3")
  end
end
