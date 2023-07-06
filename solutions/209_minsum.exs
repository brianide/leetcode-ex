defmodule Solution do
  @spec min_sub_array_len(target :: integer, nums :: [integer]) :: integer
  def min_sub_array_len(target, nums) do
    total = hd(nums)
    nums = List.to_tuple(nums)
    minimize(nums, target, total, nil, 0, 1)
  end

  # Bail early if we can
  def minimize(_, _, _, 1, _, _), do: 1

  # If we're over the target, update minval and drop an element
  def minimize(nums, target, total, minval, last, next) when total >= target do
    minval = min(minval, next - last)
    total = total - elem(nums, last)
    minimize(nums, target, total, minval, last + 1, next)
  end

  # If we're off the end, return minval
  def minimize(nums, _, _, minval, _, next) when next == tuple_size(nums) do
    minval || 0
  end

  # If we're under the target, add an element
  def minimize(nums, target, total, minval, last, next) do
    total = total + elem(nums, next)
    minimize(nums, target, total, minval, last, next + 1)
  end
end
