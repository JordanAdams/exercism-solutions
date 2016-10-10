defmodule BeerSong do
  def verse(1) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end

  def verse(2) do
    """
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    """
  end

  def verse(3) do
    """
    2 bottles of beer on the wall, 2 bottles of beer.
    Take one down and pass it around, 1 bottle of beer on the wall.
    """
  end

  def verse(number) do
    """
    #{number - 1} bottles of beer on the wall, #{number - 1} bottles of beer.
    Take one down and pass it around, #{number - 2} bottles of beer on the wall.
    """
  end

  def lyrics(), do: lyrics(100..1)

  def lyrics(range) do
    Enum.map(range, fn number -> verse(number) end)
    |> Enum.join("\n")
  end
end
