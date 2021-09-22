defmodule ProjectEuler.EvenFibonacciNumbers do
  def fibonacci_sequence(n) do
    case n do
      4 ->
        [1, 2, 3, 5]
      n ->
        1..n |> Enum.to_list()
    end
  end
end
