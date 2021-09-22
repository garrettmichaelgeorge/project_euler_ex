defmodule ProjectEuler.EvenFibonacciNumbersTest do
  use ExUnit.Case, async: true

  alias ProjectEuler.EvenFibonacciNumbers

  test "generates the first term of the Fibonacci sequence" do
    assert EvenFibonacciNumbers.fibonacci_sequence(1) == [1]
  end

  test "generates the first 2 terms of the Fibonacci sequence" do
    assert EvenFibonacciNumbers.fibonacci_sequence(2) == [1, 2]
  end
end
