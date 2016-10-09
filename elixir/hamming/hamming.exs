defmodule Hamming do
  def hamming_distance(a, b) when length(a) != length(b) do
    {:error, "Lists must be the same length"}
  end

  def hamming_distance(strand1, strand2) do
    distance = Enum.zip(strand1, strand2)
               |> Enum.filter(fn {a, b} -> a != b end)
               |> length

    {:ok, distance}
  end
end
