defmodule RunLengthEncoder do
  def encode(string) do
    String.graphemes(string)
    |> Enum.chunk_by(fn char -> char end)
    |> Enum.map(fn chars ->
      Integer.to_string(length(chars)) <> Enum.at(chars, 0)
    end)
    |> Enum.join
  end

  def decode(string) when is_binary(string) do
    Regex.scan(~r/(\d+)([A-Z]+)/, string)
    |> Enum.map_join("", fn [_, count, char] ->
      count = String.to_integer(count)

      String.pad_leading("", count, char)
    end)
  end
end
