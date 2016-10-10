defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    String.replace(sentence, ~r/\P{L}/u, "")
    |> String.downcase
    |> String.codepoints
    |> Enum.sort
    |> check_isogram
  end

  defp check_isogram([]), do: true
  defp check_isogram([x, x | _]), do: false
  defp check_isogram([_ | rest]), do: check_isogram(rest)
end
