defmodule ProjectEuler.FibonacciTest do
  use ExUnit.Case, async: true

  alias ProjectEuler.Fibonacci

  @moduletag timeout: 2000

  @fibonacci_numbers [1, 2, 3, 5, 8, 13, 21, 34]
  for {n, i} <- Enum.with_index(@fibonacci_numbers) do
    test "generates the term at position #{i} (0-indexed)" do
      i = unquote(Macro.escape(i))
      n = unquote(Macro.escape(n))
      assert Fibonacci.at(i) == n, "expected Fibonacci sequence at index #{i} to be #{n}"
    end
  end

  test "generates the first term of the Fibonacci sequence" do
    assert Fibonacci.sequence_up_to(1) == [1]
  end

  test "generates the first 2 terms of the Fibonacci sequence" do
    assert Fibonacci.sequence_up_to(2) == [1, 2]
  end

  test "generates the first 3 terms of the Fibonacci sequence" do
    assert Fibonacci.sequence_up_to(3) == [1, 2, 3]
  end

  test "generates the first 4 terms of the Fibonacci sequence" do
    assert Fibonacci.sequence_up_to(4) == [1, 2, 3, 5]
  end
end
