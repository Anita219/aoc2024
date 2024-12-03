defmodule Analyser do
  @max_allowed_diff 3

  def calc_diff({list_x, list_y}) do
    Enum.zip(list_x, list_y)
    |> Enum.reduce(0, fn {x, y}, acc -> abs(x - y) + acc end)
  end

  def calc_sim({list_x, list_y}),
    do: Enum.reduce(list_x, 0, fn x, acc -> similarity(x, acc, list_y) end)

  def count_for_factor(x, list_y), do: Enum.count(list_y, &equals(&1, x))
  def equals(x, y), do: x == y
  def similarity(x, acc, list_y), do: x * count_for_factor(x, list_y) + acc

  def safe?(list) do
    cond do
      !unique?(list) -> false
      !only_asc?(list) && !only_desc?(list) -> false
      !diff_ok?(list) -> false
      true -> true
    end
  end

  def safe?(list, false), do: safe?(list)

  def safe?(list, true) do
    list
    |> Enum.map(fn x -> List.delete(list, x) end)
    |> Enum.reduce_while(false, fn permutation, acc ->
      if safe?(permutation, acc), do: {:halt, true}, else: {:cont, false}
    end)
  end

  def unique?(list), do: list == Enum.uniq(list)
  def only_asc?(list), do: list == Enum.sort(list, :asc)
  def only_desc?(list), do: list == Enum.sort(list, :desc)

  def diff_ok?(x, y), do: abs(x - y) <= @max_allowed_diff

  def diff_ok?([x, y]) when is_integer(x) and is_integer(y), do: diff_ok?(x, y)

  def diff_ok?(list) when is_list(list) do
    [x, y | rest] = list
    diff_ok?(x, y) && diff_ok?([y | rest])
  end

  def count_safe(lists, true) do
    Enum.reduce(lists, 0, fn list, acc -> if safe?(list, true), do: acc + 1, else: acc end)
  end

  def count_safe(lists, false), do: count_safe(lists)

  def count_safe(lists) do
    Enum.reduce(lists, 0, fn list, acc -> if safe?(list), do: acc + 1, else: acc end)
  end
end
