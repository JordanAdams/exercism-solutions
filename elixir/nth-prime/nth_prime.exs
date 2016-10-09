defmodule Prime do
  def nth(count) when count < 1, do: raise "Count must be greater than 0"

  def nth(count) do
    do_nth([], count)
    |> Enum.at(count - 1)
  end

  defp do_nth(primes, count, number) when length(primes) == count do
    Enum.reverse(primes)
  end

  defp do_nth(primes, count, number) do
    case is_prime?(number) do
      true  -> do_nth([number|primes], count, number + 1)
      false -> do_nth(primes, count, number + 1)
    end
  end

  defp do_nth(primes, count), do: do_nth(primes, count, 1)

  defp is_prime?(2), do: true

  defp is_prime?(x) do
    2..(x - 1)
    |> Enum.all?(fn (y) -> rem(x, y) !== 0 end)
  end
end
