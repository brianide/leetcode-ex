defmodule Solution do
  @spec get_minimum_difference(root :: TreeNode.t | nil) :: integer
  def get_minimum_difference(root) do
    traverse(root)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(fn [a, b] -> b - a end)
    |> Enum.min()
  end

  def traverse(root), do: traverse([root], MapSet.new())
  def traverse([], set), do: Enum.sort(set)

  def traverse([root | stack], set) do
    if not root.val in set do
      stack =
        [root.right, root.left]
        |> Enum.filter(&(&1 != nil))
        |> Enum.reduce(stack, &([&1 | &2]))

      set = MapSet.put(set, root.val)
      traverse(stack, set)
    else
      traverse(stack, set)
    end
  end
end
