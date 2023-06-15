defmodule Solution do
  @spec max_level_sum(root :: TreeNode.t | nil) :: integer
  def max_level_sum(root) do
    sum_levels(root)
    |> Enum.with_index()
    |> Enum.max_by(&elem(&1, 0))
    |> then(&elem(&1, 1) + 1)
  end

  def sum_levels(root), do: sum_levels([root], [])
  def sum_levels([], sums), do: Enum.reverse(sums)

  def sum_levels(level, sums) do
    {queue, sum} =
      Enum.reduce(level, {[], 0}, fn
        node, {queue, sum} -> {[node.left, node.right | queue], sum + node.val}
      end)

    sum_levels(queue |> Enum.filter(&(&1)), [sum | sums])
  end
end
