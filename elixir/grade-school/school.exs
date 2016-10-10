defmodule School do
  def add(db, name, grade) do
    Map.put(db, grade, [name | Map.get(db, grade, [])])
  end

  def grade(db, grade) do
    Map.get(db, grade, []) |> Enum.sort
  end

  def sort(db) do
    Map.keys(db)
    |> Enum.map(fn g -> {g, grade(db, g)} end)
  end
end
