# Directly adapted from the imperative solution in the editorial; really slow

defmodule Solution do
  @spec longest_arith_seq_length(nums :: [integer]) :: integer
  def longest_arith_seq_length(nums) do
    nums = List.to_tuple(nums)
    for right <- 0..(tuple_size(nums) - 1),
        left <- 0..(right - 1)//1 do
      {left, right}
    end
    |> Enum.reduce(%{}, fn {left, right}, dp ->
      diff = elem(nums, right) - elem(nums, left)
      val = Map.get(dp, {left, diff}, 1) + 1
      Map.put(dp, {right, diff}, val)
    end)
    |> Map.values()
    |> Enum.max()
  end
end
