defmodule ProjectEuler.MultiplesOf3Or5 do
  @moduledoc ~S"""
  "If we list all the natural numbers below 10 that are multiples of 3 or 5, we
  get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000."
  - Project Euler Problem 1 (https://projecteuler.net/problem=1)
  """

  defguard is_multiple_of(n, divisor) when rem(n, divisor) == 0

  def run do
    sum_multiples_of(1000, [3, 5])
  end

  @spec multiple_of?(non_neg_integer, non_neg_integer) :: boolean
  def multiple_of?(n, divisor) when is_multiple_of(n, divisor), do: true
  def multiple_of?(n, _) when is_integer(n), do: false
  def multiple_of_3?(n), do: multiple_of?(n, 3)
  def multiple_of_5?(n), do: multiple_of?(n, 5)

  @spec list_multiples_of(non_neg_integer, non_neg_integer) :: [non_neg_integer]
  def list_multiples_of(n, divisor) when is_integer(n) and is_integer(divisor) do
    1..(n - 1)
    |> Enum.filter(&multiple_of?(&1, divisor))
  end

  @spec list_multiples_of(non_neg_integer, [non_neg_integer]) :: [non_neg_integer]
  def list_multiples_of(n, divisors) when is_integer(n) and is_list(divisors) do
    divisors
    |> Enum.reduce([], fn divisor, acc ->
      acc ++ list_multiples_of(n, divisor)
    end)
    |> Enum.sort()
    |> Enum.uniq()
  end

  @spec sum_multiples_of(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def sum_multiples_of(n, divisors) when is_integer(n) and is_list(divisors) do
    n
    |> list_multiples_of(divisors)
    |> Enum.sum()
  end

  def sum_multiples_of_3_or_5(n) when is_integer(n) do
    sum_multiples_of(n, [3, 5])
  end
end
