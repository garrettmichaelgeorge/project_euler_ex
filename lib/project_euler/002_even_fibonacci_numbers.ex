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
  def run, do: sum_evens_no_greater_than(4_000_000)

  def sum_evens_no_greater_than(val) do
    val
    |> stream_no_greater_than()
    |> Enum.sum()
  end

  def sum_even_terms_up_to(n) do
    1..n
    |> Stream.filter(&even?/1)
    |> Stream.map(&at/1)
    |> Enum.sum()
  end

  def stream_no_greater_than(val) do
    1..1_000_000_000
    |> Stream.filter(&even?/1)
    |> Stream.map(&at/1)
    |> Stream.take_while(& &1 <= val)
  end

  def even_up_to(n) when is_integer(n) and n > 0 do
    1..n
    |> Stream.filter(&even?/1)
    |> Stream.map(&at/1)
    |> Enum.to_list()
  end

  def up_to(n) when is_integer(n) and n > 0 do
    1..n
    |> Stream.map(&at/1)
    |> Enum.to_list()
  end

  def at(1), do: 1
  def at(2), do: 2

  def at(n) when is_integer(n) and n > 2,
    do: at(n - 1) + at(n - 2)

  def even?(n) when rem(n, 2) == 0, do: true
  def even?(_), do: false
end
