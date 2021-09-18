defmodule ProjectEuler.MultiplesOf3Or5 do
  def run do
  end

  def multiple_of_3?(n) when rem(n, 3) == 0, do: true
  def multiple_of_3?(_), do: false
end
