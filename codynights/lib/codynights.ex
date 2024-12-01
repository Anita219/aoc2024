defmodule Codynights do
  def calc_diff(list_x, list_y) do
    Enum.zip(list_x, list_y)
    |> Enum.reduce(0, fn {x, y}, acc -> abs(x - y) + acc end)
  end

  def calc_similarity(list_x, list_y) do
    list_x
    |> Enum.reduce(
      0,
      fn x, acc ->
        x * factor(x, list_y) + acc
      end
    )
  end

  def factor(x, list_y) do
    list_y
    |> Enum.count(&equals(&1, x))
  end

  def equals(x, y), do: x == y

  def calc_sim_from(input) do
    lines =
      input
      |> String.split()
      |> Enum.map(&String.to_integer/1)

    calc_similarity(prepare_list(lines, 0), prepare_list(lines, 1))
  end

  def list_from(input) do
    lines =
      input
      |> String.split()
      |> Enum.map(&String.to_integer/1)

    calc_diff(prepare_list(lines, 0), prepare_list(lines, 1))
  end

  def prepare_list(lines, start) do
    lines
    |> Enum.slice(start..-1//2)
    |> Enum.sort()
  end
end
