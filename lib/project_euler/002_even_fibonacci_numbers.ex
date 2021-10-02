defmodule ProjectEuler.Fibonacci do
  @moduledoc """
  This is a solution for Project Euler Problem 2.

  > Each new term in the Fibonacci sequence is generated by adding the previous
  > two terms. By starting with 1 and 2, the first 10 terms will be:

  > 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

  > By considering the terms in the Fibonacci sequence whose values do not exceed
  > four million, find the sum of the even-valued terms.
  > - [Project Euler Problem 2](https://projecteuler.net/problem=2)
  """
  def sum_even_terms_up_to(n) do
    n
    |> even_up_to()
    |> Enum.sum()
  end

  def less_than(value) do
    [2, 5]
  end

  def even_up_to(n) when is_integer(n) and n > 0 do
    1..n
    |> Enum.filter(fn x -> rem(x, 2) == 0 end)
    |> Enum.map(&at/1)
  end

  def up_to(n) when is_integer(n) and n > 0 do
    Enum.map(1..n, &at/1)
  end

  def at(1), do: 1
  def at(2), do: 2

  def at(n) when is_integer(n) and n > 2,
    do: at(n - 1) + at(n - 2)
end
