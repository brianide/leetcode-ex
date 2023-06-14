defmodule Solution do
  @spec get_minimum_difference(root :: TreeNode.t | nil) :: integer
  def get_minimum_difference(root) do
    traverse(root)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [a, b] -> b - a end)
    |> Enum.min()
  end

  def traverse(root), do: traverse([], root)
  def traverse(list, nil), do: list

  def traverse(list, root) do
    traverse(list, root.right)
    |> then(&([root.val | &1]))
    |> traverse(root.left)
  end
end
