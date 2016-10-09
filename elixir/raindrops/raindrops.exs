defmodule Raindrops do
  @factors [
    {3, "Pling"},
    {5, "Plang"},
    {7, "Plong"}
  ]

  def convert(number) do
    result = Enum.reduce(@factors, "", fn({factor, word}, acc) ->
      if has_factor?(number, factor),
         do: acc <> word,
         else: acc
    end)

    if is_blank?(result),
       do: Integer.to_string(number),
       else: result
  end

  def has_factor?(number, factor), do: rem(number, factor) == 0

  def is_blank?(string), do: String.trim(string) == ""
end
