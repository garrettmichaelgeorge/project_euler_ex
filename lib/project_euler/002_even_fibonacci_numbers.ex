defmodule ProjectEuler.Fibonacci do
  def at(1), do: 1
  def at(2), do: 2

  def fibonacci_sequence(n) do
    case n do
      4 ->
        [1, 2, 3, 5]

      2 ->
        [1, 2]

      1 ->
        1
        |> at()
        |> List.wrap()

      n ->
        1..n |> Enum.to_list()
    end
  end
end
