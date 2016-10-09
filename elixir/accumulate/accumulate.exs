defmodule Accumulate do
  def accumulate(list, fun) do
    Enum.map(list, fun)
  end
end
