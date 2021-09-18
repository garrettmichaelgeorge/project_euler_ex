defmodule ProjectEuler.MultiplesOf3Or5 do
  defguard is_multiple_of_3(n) when rem(n, 3) == 0
  defguard is_multiple_of(n, base) when rem(n, base) == 0

  def multiple_of_3?(n) when is_multiple_of(n, 3), do: true
  def multiple_of_3?(_), do: false

  def multiple_of_5?(n) when is_multiple_of(n, 5), do: true
  def multiple_of_5?(_), do: false
end
