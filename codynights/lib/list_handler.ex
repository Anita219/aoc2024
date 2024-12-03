defmodule ListHandler do
  def half_vertically(list), do: {sorted_side(list, :left), sorted_side(list, :right)}

  def sorted_side(list, start) do
    case start do
      :left -> Enum.slice(list, 0..-1//2) |> Enum.sort()
      :right -> Enum.slice(list, 1..-1//2) |> Enum.sort()
    end
  end
end
