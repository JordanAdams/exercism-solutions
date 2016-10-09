defmodule Acronym do
  def abbreviate(string) do
    split_into_words(string)
    |> Enum.map(&String.first/1)
    |> Enum.join
    |> String.upcase
  end

  defp split_into_words(string) do
    String.split(string)
    |> Enum.map(&split_title_case/1)
    |> List.flatten
  end

  defp split_title_case(string) do
    String.replace(string, ~r/([A-Z])/, " \\1")
    |> String.split
  end
end
