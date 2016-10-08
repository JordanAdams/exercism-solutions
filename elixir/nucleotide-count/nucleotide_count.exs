defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  def count(strand, nucleotide) do
    strand
    |> Enum.filter(&(&1 == nucleotide))
    |> length
  end

  def histogram(strand) do
    charmap = charlist_to_map(@nucleotides)

    Enum.reduce(strand, charmap, fn(char, acc) ->
      count = Map.get(acc, char, 0)

      Map.put(acc, char, count + 1)
    end)
  end

  def charlist_to_map(chars) do
    Enum.reduce(chars, %{}, &Map.put(&2, &1, 0))
  end

  def equals(a, b), do: a == b
end
