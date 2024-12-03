defmodule Wordler do
  def multi(string) do
    regex = ~r/mul\((?<numberx>\d{1,3}),(?<numbery>\d{1,3})\)/

    Regex.scan(regex, string, capture: ["numberx", "numbery"])
    |> Enum.reduce(0, fn list, acc -> multiply(list) + acc end)
  end

  def multiply(["", ""]), do: 0
  def multiply([x, y]), do: String.to_integer(x) * String.to_integer(y)
  def multiply(_), do: 0
end
