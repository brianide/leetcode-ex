defmodule Solution do
  @spec find_different_binary_string(nums :: [String.t]) :: String.t
  def find_different_binary_string(nums) do
    len = hd(nums) |> String.length()
    set = Enum.map(nums, &String.to_integer(&1, 2)) |> MapSet.new()

    Stream.iterate(0, &(&1 + 1))
    |> Enum.find(&(&1 not in set))
    |> Integer.to_string(2)
    |> String.pad_leading(len, "0")
  end
end
