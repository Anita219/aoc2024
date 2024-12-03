defmodule FileHandler do
  def from(path), do: File.read(path)

  def list_from(path) do
    File.read!(path)
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  def lists_from(path) do
    File.read!(path)
    |> String.split(~r{\r\n}, trim: true)
    |> Enum.map(&String.split/1)
    |> Enum.map(fn list -> Enum.map(list, fn string -> String.to_integer(string) end) end)
  end

  def string_from(path) do
    File.read!(path)
  end
end
