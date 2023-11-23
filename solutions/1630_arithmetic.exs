defmodule Solution do
  @spec check_arithmetic_subarrays(nums :: [integer], l :: [integer], r :: [integer]) :: [boolean]
  def check_arithmetic_subarrays(nums, l, r) do
    Enum.zip(l, r)
    |> Enum.map(fn {a, b} -> check_range(nums, a, b) end)
  end

  def check_range(nums, a, b) do
    nums
    |> Enum.slice(a .. b)
    |> Enum.sort()
    |> Enum.reduce_while(nil, fn
      n, nil -> {:cont, {n, nil}}
      n, {p, nil} -> {:cont, {n, n - p}}
      n, {p, diff} when n - p == diff -> {:cont, {n, diff}}
      _, _ -> {:halt, false}
    end)
    |> then(& !!&1)
  end
end
