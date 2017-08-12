defmodule RotationalCipher do
  def rotate(text, shift) when (shift >= 26),
    do: rotate(text, shift - 26)

  def rotate(text, shift) do
    text
    |> String.to_charlist
    |> Enum.map(&rotate_char(&1, shift))
    |> List.to_string
  end

  defp rotate_char(char, shift) when (char in ?a..?z) and (char + shift > ?z),
    do: ?a + ((char + shift) - ?z) - 1

  defp rotate_char(char, shift) when (char in ?A..?Z) and (char + shift > ?Z),
    do: ?A + ((char + shift) - ?Z) - 1

  defp rotate_char(char, shift) when (char in ?A..?Z) or (char in ?a..?z),
    do: char + shift

  defp rotate_char(char, shift),
    do: char
end
