defmodule Solution do
  @spec get_averages(nums :: [integer], k :: integer) :: [integer]
  def get_averages(nums, k) when length(nums) < k * 2 + 1, do: for _ <- nums, do: -1

  def get_averages(nums, k) do
    pad = for _ <- 1..k//1, do: -1
    diam = k * 2 + 1
    get_sums(nums, diam)
    |> Enum.map(&trunc(&1 / diam))
    |> then(&Enum.concat([pad, &1, pad]))
  end

  def get_sums(nums, diam) do
    arr = List.to_tuple(nums)
    pool = Enum.take(nums, diam) |> Enum.sum()
    get_sums(arr, [pool], pool, 0, diam)
  end

  def get_sums(arr, sums, pool, st, ed) when ed == tuple_size(arr) do
    Enum.reverse(sums)
  end

  def get_sums(arr, sums, pool, st, ed) do
    pool = pool - elem(arr, st) + elem(arr, ed)
    sums = [pool | sums]
    get_sums(arr, sums, pool, st + 1, ed + 1)
  end
end
