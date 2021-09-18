defmodule ProjectEuler.MultiplesOf3Or5Test do
  use ExUnit.Case, async: true

  alias ProjectEuler.MultiplesOf3Or5

  describe "multiple_of_3?/1" do
    @multiples_of_3 [3, 6, 9, 12, 24]

    for n <- @multiples_of_3 do
      test "returns true for #{n}" do
        n = unquote(Macro.escape(n))
        assert MultiplesOf3Or5.multiple_of_3?(n), "should return true for a multiple of 3"
      end
    end

    test "returns false for 5" do
      refute MultiplesOf3Or5.multiple_of_3?(5), "should return false for a multiple of 3"
    end
  end
end
