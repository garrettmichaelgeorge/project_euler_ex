defmodule ProjectEuler.FibonacciTest do
  use ExUnit.Case, async: true

  alias ProjectEuler.Fibonacci

  test "generates the term at the first position" do
    assert Fibonacci.at(1) == 1
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
