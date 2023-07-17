# Definition for singly-linked list.
defmodule Solution do
  @spec add_two_numbers(l1 :: ListNode.t | nil, l2 :: ListNode.t | nil) :: ListNode.t | nil
  def add_two_numbers(l1, l2) do
    to_intval(l1) + to_intval(l2)
    |> to_nodes()
  end

  def to_intval(root), do: to_intval(root, 0)
  def to_intval(nil, sum), do: sum
  def to_intval(%ListNode{val: v, next: n}, sum), do: to_intval(n, sum * 10 + v)

  def to_nodes(0), do: %ListNode{val: 0, next: nil}
  def to_nodes(val), do: to_nodes(val, nil)
  def to_nodes(0, prev), do: prev
  def to_nodes(val, prev), do: to_nodes(div(val, 10), %ListNode{val: rem(val, 10), next: prev})
end
