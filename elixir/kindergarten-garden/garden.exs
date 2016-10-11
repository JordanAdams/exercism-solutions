defmodule Garden do
  @plants %{
    "G" => :grass,
    "C" => :clover,
    "R" => :radishes,
    "V" => :violets
  }

  @children [
    :alice, :bob, :charlie, :david,
    :eve, :fred, :ginny, :harriet,
    :ileana, :joseph, :kincaid, :larry
  ]

  def info(garden, children \\ @children) do
    garden = parse_garden(garden)

    Enum.sort(children)
    |> Enum.with_index
    |> Enum.reduce(%{}, fn {child, index}, acc ->
      Map.put(acc, child, Enum.at(garden, index, {}))
    end)
  end

  defp parse_garden(garden) do
    String.split(garden, "\n")
    |> Enum.map(&parse_garden_row(&1))
    |> List.zip
    |> Enum.map(fn {a, b} -> List.to_tuple(a ++ b) end)
  end

  defp parse_garden_row(row) do
    String.graphemes(row)
    |> Enum.map(&Map.get(@plants, &1))
    |> Enum.chunk(2)
  end
end
