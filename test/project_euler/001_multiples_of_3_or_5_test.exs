defmodule ProjectEuler.MultiplesOf3Or5Test do
  use ExUnit.Case, async: true

  alias ProjectEuler.MultiplesOf3Or5

  describe "multiple_of_3?/1" do
    test "returns true for 3" do
      assert MultiplesOf3Or5.multiple_of_3?(3), "should return true for a multiple of 3"
    end
  end
end
