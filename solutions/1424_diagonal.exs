defmodule Solution do
  @spec find_diagonal_order(nums :: [[integer]]) :: [integer]
  def find_diagonal_order(nums) do
    Enum.with_index(nums)
    |> Enum.flat_map(fn {row, i} ->
      Enum.with_index(row, fn n, j ->
        {n, (i + j) * 100000 - i}
      end)
    end)
    |> Enum.sort_by(&Kernel.elem(&1, 1))
    |> Enum.map(&Kernel.elem(&1, 0))
  end
end
