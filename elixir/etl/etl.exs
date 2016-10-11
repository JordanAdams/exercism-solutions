defmodule ETL do
  def transform(input) do
    Enum.reduce(input, %{}, fn({score, words}, acc) ->
      set_keys(acc, downcase_list(words), score)
    end)
  end

  def set_keys(map, keys, value), do: Enum.reduce(keys, map, &Map.put(&2, &1, value))

  defp downcase_list(list), do: Enum.map(list, &String.downcase(&1))
end
