defmodule Scrabble do
  @scores [
    {1, ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]},
    {2, ["D", "G"]},
    {3, ["B", "C", "M", "P"]},
    {4, ["F", "H", "V", "W", "Y"]},
    {5, ["K"]},
    {8, ["J", "X"]},
    {10, ["Q", "Z"]}
  ]

  def score(word) do
    get_letters(word)
    |> Enum.map(&letter_score/1)
    |> Enum.sum
  end

  def letter_score(letter) do
    foundScore = Enum.find(@scores, fn {_, letters} ->
      Enum.member?(letters, letter)
    end)

    case foundScore do
      {score, _} -> score
      _ -> 0
    end
  end

  def get_letters(word) do
    String.trim(word)
    |> String.upcase
    |> String.graphemes
  end
end
