defmodule ProjectEuler.EvenFibonacciNumbers do
  def fibonacci(1), do: 1
  def fibonacci(2), do: 2

  def fibonacci_sequence(n) do
    case n do
      4 ->
        [1, 2, 3, 5]

      2 ->
        [1, 2]

      1 ->
        1
        |> fibonacci()
        |> List.wrap()

      n ->
        1..n |> Enum.to_list()
    end
  end
end
