defmodule CodynightsTest do
  use ExUnit.Case
  alias Analyser

  test "calculates the distance between two lists" do
    assert Analyser.calc_diff({[1, 2, 3], [1, 2, 3]}) == 0
    assert Analyser.calc_diff({[1, 2, 3], [1, 3, 4]}) == 2
  end

  test "calculates the similarities between two lists" do
    assert Analyser.calc_sim({[3, 4, 2, 1, 3, 3], [4, 3, 5, 3, 9, 3]}) == 31
  end

  test "calculates if list is safe" do
    assert Analyser.safe?([1, 2, 3, 4]) == true
    assert Analyser.safe?([4, 3, 2, 1]) == true
    assert Analyser.safe?([3, 1, 2, 4]) == false
    assert Analyser.safe?([1, 5, 6, 7]) == false
    assert Analyser.safe?([85, 86, 87, 88, 85]) == false
    assert Analyser.safe?([30, 32, 35, 36, 36]) == false
    assert Analyser.safe?([75, 77, 79, 81, 84, 87, 91]) == false
  end

  test "calculates if difference between values is too big" do
    assert Analyser.diff_ok?(1, 2) == true
    assert Analyser.diff_ok?(1, 5) == false
    assert Analyser.diff_ok?([1, 2, 3]) == true
  end

  test "counts how many lists in a list are safe" do
    assert Analyser.count_safe([[1, 2, 3, 4], [4, 3, 2, 1]]) == 2
    assert Analyser.count_safe([[1, 4, 3, 4], [4, 3, 2, 1]]) == 1
  end

  test "included a problem dampener" do
    assert Analyser.count_safe([[1, 2, 3, 4], [2, 3, 5, 4]], true) == 2
    assert Analyser.count_safe([[3, 1, 2, 4], [1, 3, 6, 2, 1]], true) == 1
  end
end
