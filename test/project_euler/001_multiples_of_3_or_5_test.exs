defmodule ProjectEuler.MultiplesOf3Or5Test do
  use ExUnit.Case, async: true

  alias ProjectEuler.MultiplesOf3Or5

  describe "multiple_of_3?/1" do
    @multiples_of_3 [3, 6, 9, 12, 24, 249, 1005, 81_456]

    for n <- @multiples_of_3 do
      test "returns true for #{n}" do
        n = unquote(Macro.escape(n))
        assert MultiplesOf3Or5.multiple_of_3?(n), "should return true for #{n}"
      end
    end

    @invalid_multiples_of_3 [5, 10, 17, 248, 9_182]
    for n <- @invalid_multiples_of_3 do
      test "returns false for #{n}" do
        n = unquote(Macro.escape(n))
        refute MultiplesOf3Or5.multiple_of_3?(n), "should return false for #{n}"
      end
    end

    test "raises for non-integers" do
      assert_raise FunctionClauseError, fn ->
        MultiplesOf3Or5.multiple_of_3?("foo")
      end
    end
  end

  describe "multiple_of_5?/1" do
    @multiples_of_5 [5, 10, 15, 20, 25, 2555]

    for n <- @multiples_of_5 do
      test "returns true for #{n}" do
        n = unquote(Macro.escape(n))
        assert MultiplesOf3Or5.multiple_of_5?(n), "should return true for #{n}"
      end
    end

    test "returns false for 7" do
      refute MultiplesOf3Or5.multiple_of_5?(7), "should return false for 7"
    end

    test "raises for non-integers" do
      assert_raise FunctionClauseError, fn ->
        MultiplesOf3Or5.multiple_of_5?("foo")
      end
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
      assert [3, 6, 9, 12, 15, 18, 21, 24, 27, 30] = MultiplesOf3Or5.list_multiples_of(30, 3)
    end

    test "returns a list of multiples of 5 below 20" do
      assert [5, 10, 15, 20] = MultiplesOf3Or5.list_multiples_of(20, 5)
    end
  end
end
