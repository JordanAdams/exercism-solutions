defmodule Bob do
  def hey(input) do
    cond do
      is_silence?(input) -> "Fine. Be that way!"
      is_shouting?(input) -> "Whoa, chill out!"
      is_question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp is_silence?(input), do: String.match?(input, ~r/^\s*$/)

  defp is_shouting?(input) do
    String.match?(input, ~r/^(?:\p{Lu}|[^\p{L}])+[^?]$/)
    && String.match?(input, ~r/\p{Lu}/)
  end

  defp is_question?(input), do: String.match?(input, ~r/\?$/)
end
