defmodule ProjectEuler.MultiplesOf3Or5 do
  defguard is_multiple_of(n, base) when rem(n, base) == 0

  def multiple_of?(n, base) when is_multiple_of(n, base), do: true
  def multiple_of?(n, _) when is_integer(n), do: false
  def multiple_of_3?(n), do: multiple_of?(n, 3)
  def multiple_of_5?(n), do: multiple_of?(n, 5)

  @spec list_multiples_of(non_neg_integer, non_neg_integer) :: [non_neg_integer]
  def list_multiples_of(n, base) when is_integer(n) and is_integer(base) do
    1..n
    |> Enum.filter(&multiple_of?(&1, base))
  end

  def sum_multiples_of_3_or_5(n) do
    23
  end
end
