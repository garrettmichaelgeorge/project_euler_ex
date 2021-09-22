defmodule ProjectEuler.Fibonacci do
  def at(0), do: 1
  def at(1), do: 2
  def at(n) when is_integer(n) and n > 1,
    do: at(n - 1) + at(n - 2)

  def sequence_up_to(n) do
    Enum.map(0..n, &at/1)
  end
end
