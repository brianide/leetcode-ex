defmodule Solution do
  @spec longest_subarray(nums :: [integer]) :: integer
  def longest_subarray(nums) do
    Enum.reduce(nums, [0], fn
      0, [n | more] -> [0, n | more]
      1, [n | more] -> [n + 1 | more]
    end)
    |> case do
      [n] -> n - 1
      many -> Enum.chunk_every(many, 2, 1, :discard) |> Enum.map(&Enum.sum/1) |> Enum.max()
    end
  end
end
