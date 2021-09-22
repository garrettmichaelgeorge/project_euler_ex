defmodule ProjectEuler.EvenFibonacciNumbers do
  def fibonacci_sequence(n) do
    case n do
      3 -> [1, 2, 3]
      2 -> [1, 2]
      1 -> [1]
    end
  end
end
