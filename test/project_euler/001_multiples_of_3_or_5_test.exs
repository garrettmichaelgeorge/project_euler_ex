defmodule ProjectEuler.MultiplesOf3Or5Test do
  use ExUnit.Case, async: true

  alias ProjectEuler.MultiplesOf3Or5

  describe "run/0" do
    test "returns the correct answer" do
      assert MultiplesOf3Or5.run() == 233_168
    end
  end

  describe "multiple_of?/2" do
    @multiples_of_3 [3, 6, 9, 12, 24, 249, 1005, 81_456]

    for n <- @multiples_of_3 do
      test "returns true for #{n}" do
        n = unquote(Macro.escape(n))
        assert MultiplesOf3Or5.multiple_of?(n, 3), "should return true for #{n}"
      end
    end

    @invalid_multiples_of_3 [5, 10, 17, 248, 9_182]
    for n <- @invalid_multiples_of_3 do
      test "returns false for #{n}" do
        n = unquote(Macro.escape(n))
        refute MultiplesOf3Or5.multiple_of?(n, 3), "should return false for #{n}"
      end
    end

    test "raises for non-integers" do
      assert_raise FunctionClauseError, fn -> MultiplesOf3Or5.multiple_of?("foo", 3) end
      assert_raise FunctionClauseError, fn -> MultiplesOf3Or5.multiple_of?(3, "foo") end
    end
  end

  describe "multiple_of_5?/1" do
    @multiples_of_5 [5, 10, 15, 20, 25, 2555]

    for n <- @multiples_of_5 do
      test "returns true for #{n}" do
        n = unquote(Macro.escape(n))
        assert MultiplesOf3Or5.multiple_of?(n, 5), "should return true for #{n}"
      end
    end

    test "returns false for 7" do
      refute MultiplesOf3Or5.multiple_of?(7, 5), "should return false for 7"
    end
  end

  describe "list_multiples_of/2" do
    test "returns a list of multiples of 3 below 10" do
      assert [3, 6, 9] = MultiplesOf3Or5.list_multiples_of(10, 3)
    end

    test "returns a list of multiples of 3 below 20" do
      assert [3, 6, 9, 12, 15, 18] = MultiplesOf3Or5.list_multiples_of(20, 3)
    end

    test "returns a list of multiples of 3 below 30" do
      assert [3, 6, 9, 12, 15, 18, 21, 24, 27] = MultiplesOf3Or5.list_multiples_of(30, 3)
    end

    test "returns a list of multiples of 5 below 20" do
      assert [5, 10, 15] = MultiplesOf3Or5.list_multiples_of(20, 5)
    end

    test "returns a list of multiples of 24 below 200" do
      assert [24, 48, 72, 96, 120, 144, 168, 192] = MultiplesOf3Or5.list_multiples_of(200, 24)
    end

    test "takes a list of multiples" do
      assert [3, 5, 6, 9] = MultiplesOf3Or5.list_multiples_of(10, [3, 5])
    end

    test "returns no duplicate elements" do
      assert [3, 5, 6, 9, 10, 12, 15] = MultiplesOf3Or5.list_multiples_of(16, [3, 5])
    end

    test "raises for non-integers" do
      assert_raise FunctionClauseError, fn ->
        MultiplesOf3Or5.list_multiples_of("foo", 5)
        MultiplesOf3Or5.list_multiples_of(5, [:bar])
      end
    end
  end

  describe "sum_multiples_of/2" do
    test "returns a sum of the multiples of 3 or 5 below 10" do
      assert MultiplesOf3Or5.sum_multiples_of(10, [3, 5]) == 23
    end

    test "returns a sum of the multiples of 3 or 5 below 30" do
      assert MultiplesOf3Or5.sum_multiples_of(30, [3, 5]) == 195
    end

    test "raises for non-integers" do
      assert_raise FunctionClauseError, fn -> MultiplesOf3Or5.sum_multiples_of(["foo"], [2]) end
      assert_raise FunctionClauseError, fn -> MultiplesOf3Or5.sum_multiples_of(2, "foo") end
      assert_raise FunctionClauseError, fn -> MultiplesOf3Or5.sum_multiples_of(5, 2) end
    end
  end
end
