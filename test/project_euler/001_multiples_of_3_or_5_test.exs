defmodule ProjectEuler.MultiplesOf3Or5Test do
  use ExUnit.Case, async: true

  alias ProjectEuler.MultiplesOf3Or5

  describe "multiple_of_3?/1" do
    test "returns true for 3" do
      assert MultiplesOf3Or5.multiple_of_3?(3), "should return true for a multiple of 3"
    end

    test "returns true for 9" do
      assert MultiplesOf3Or5.multiple_of_3?(9), "should return true for a multiple of 3"
    end

    test "returns false for 5" do
      refute MultiplesOf3Or5.multiple_of_3?(5), "should return false for a multiple of 3"
    end
  end
end
