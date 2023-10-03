defmodule Solution do
  @spec num_identical_pairs(nums :: [integer]) :: integer
  def num_identical_pairs(nums) do
    Enum.frequencies(nums)
    |> Map.values()
    |> Enum.map(&tri/1)
    |> Enum.sum()
  end

  def tri(n), do: div(n * (n - 1), 2)
end
