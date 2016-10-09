defmodule Anagram do
  def match(base, candidates) do
    Enum.filter(candidates, fn(candidate) ->
      cond do
        String.downcase(base) === String.downcase(candidate) -> false
        format_string(base) === format_string(candidate)     -> true
        true -> false
      end
    end)
  end

  defp format_string(string) do
    String.downcase(string)
    |> String.graphemes
    |> Enum.sort
    |> Enum.join
  end
end
