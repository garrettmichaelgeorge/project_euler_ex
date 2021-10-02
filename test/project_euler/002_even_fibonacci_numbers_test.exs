defmodule ProjectEuler.FibonacciTest do
  use ExUnit.Case, async: true

  alias ProjectEuler.Fibonacci

  # to handle infinite recursive loops...this should be unnecessary as long as
  # inputs are being guarded properly
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
    assert Fibonacci.sequence_up_to(0) == [1]
  end

  test "generates the first 2 terms of the Fibonacci sequence" do
    assert Fibonacci.sequence_up_to(1) == [1, 2]
  end

  test "generates the first 3 terms of the Fibonacci sequence" do
    assert Fibonacci.sequence_up_to(2) == [1, 2, 3]
  end

  test "generates the first 4 terms of the Fibonacci sequence" do
    assert Fibonacci.sequence_up_to(3) == [1, 2, 3, 5]
  end

  test "generates the first 5 terms of the Fibonacci sequence" do
    assert Fibonacci.sequence_up_to(4) == [1, 2, 3, 5, 8]
  end

  test "generates the first 6 terms of the Fibonacci sequence" do
    assert Fibonacci.sequence_up_to(5) == [1, 2, 3, 5, 8, 13]
  end

  test "rejects negative numbers" do
    assert_raise FunctionClauseError, fn -> Fibonacci.at(-1) end
  end

  test "at/1 only accepts positive integers" do
    assert_raise FunctionClauseError, fn -> Fibonacci.at(5.9) end
    assert_raise FunctionClauseError, fn -> Fibonacci.at("foo") end
    assert_raise FunctionClauseError, fn -> Fibonacci.at([5]) end
  end

  test "sequence_up_to/1 only accepts positive integers" do
    assert_raise FunctionClauseError, fn -> Fibonacci.sequence_up_to(-1) end
    assert_raise FunctionClauseError, fn -> Fibonacci.sequence_up_to("foo") end
    assert_raise FunctionClauseError, fn -> Fibonacci.sequence_up_to([5]) end
  end

  test "sums even-valued terms up to 1" do
    assert Fibonacci.sum_even_terms_up_to(1) == 0
  end

  test "sums even-valued terms up to 2" do
    assert Fibonacci.sum_even_terms_up_to(2) == 2
  end

  test "sums even-valued terms up to 5" do
    assert Fibonacci.sum_even_terms_up_to(5) == 7
  end
end
