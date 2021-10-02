defmodule ProjectEuler.FibonacciTest do
  use ExUnit.Case, async: true

  alias ProjectEuler.Fibonacci

  # to handle infinite recursive loops...this should be unnecessary as long as
  # inputs are being guarded properly
  @moduletag timeout: 2000

  @fibonacci_numbers [1, 2, 3, 5, 8, 13, 21, 34]
  for {n, i} <- Enum.with_index(@fibonacci_numbers) do
    test "generates the term at position #{i} (1-indexed)" do
      i = unquote(Macro.escape(i)) + 1
      n = unquote(Macro.escape(n))
      assert Fibonacci.at(i) == n, "expected Fibonacci sequence at index #{i} to be #{n}"
    end
  end

  test "generates the first term of the Fibonacci sequence" do
    assert Fibonacci.up_to(1) == [1]
  end

  test "generates the first 2 terms of the Fibonacci sequence" do
    assert Fibonacci.up_to(2) == [1, 2]
  end

  test "generates the first 3 terms of the Fibonacci sequence" do
    assert Fibonacci.up_to(3) == [1, 2, 3]
  end

  test "generates the first 4 terms of the Fibonacci sequence" do
    assert Fibonacci.up_to(4) == [1, 2, 3, 5]
  end

  test "generates the first 5 terms of the Fibonacci sequence" do
    assert Fibonacci.up_to(5) == [1, 2, 3, 5, 8]
  end

  test "generates the first 6 terms of the Fibonacci sequence" do
    assert Fibonacci.up_to(6) == [1, 2, 3, 5, 8, 13]
  end

  test "rejects negative numbers" do
    assert_raise FunctionClauseError, fn -> Fibonacci.at(-1) end
  end

  test "at/1 only accepts positive integers" do
    assert_raise FunctionClauseError, fn -> Fibonacci.at(5.9) end
    assert_raise FunctionClauseError, fn -> Fibonacci.at("foo") end
    assert_raise FunctionClauseError, fn -> Fibonacci.at([5]) end
  end

  test "up_to/1 only accepts positive integers" do
    assert_raise FunctionClauseError, fn -> Fibonacci.up_to(-1) end
    assert_raise FunctionClauseError, fn -> Fibonacci.up_to("foo") end
    assert_raise FunctionClauseError, fn -> Fibonacci.up_to([5]) end
  end

  @even_up_to_answers [
    {1, []},
    {2, [2]},
    {3, [2]},
    {4, [2, 5]},
    {5, [2, 5]},
    {6, [2, 5, 13]},
    {7, [2, 5, 13]},
  ]

  for {n, expected} <- @even_up_to_answers do
    test "even_up_to/1 generates the even-termed Fibonacci sequence up to term #{n}" do
      n = unquote(Macro.escape(n))
      expected = unquote(Macro.escape(expected))

      assert Fibonacci.even_up_to(n) == expected
    end
  end

  @sum_even_terms [
    {1, 0},
    {2, 2},
    {3, 2},
    {4, 7},
    {5, 7},
    {6, 20},
    {7, 20},
    {8, 54},
    {9, 54}
  ]

  for {n, expected} <- @sum_even_terms do
    test "sums even-valued terms up to #{n}" do
      n = unquote(Macro.escape(n))
      expected = unquote(Macro.escape(expected))
      actual = Fibonacci.sum_even_terms_up_to(n)

      assert actual == expected,
             """
             Expected: #{expected}
             Actual: #{actual}
             """
    end
  end
end
