defmodule Words do
  def count(sentence) do
    sanitize(sentence)
    |> String.split
    |> Enum.reduce(%{}, fn(word, acc) ->
      count = Map.get(acc, word, 0)

      Map.put(acc, word, count + 1)
    end)
  end

  def sanitize(sentence) do
    String.trim(sentence)
    |> String.downcase
    |> String.replace(~r/[^\p{L}0-9-]/u, " ")
  end
end
