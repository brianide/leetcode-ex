# Definition for singly-linked list.
defmodule Solution do
  @spec add_two_numbers(l1 :: ListNode.t | nil, l2 :: ListNode.t | nil) :: ListNode.t | nil
  def add_two_numbers(l1, l2) do
    to_intval(l1) + to_intval(l2)
    |> to_nodes()
  end

  def to_intval(root) do
    Stream.unfold(root, fn
      nil -> nil
      %ListNode{val: n, next: next} -> {n, next}
    end)
    |> Enum.reduce(0, &(&1 + &2 * 10))
  end

  def to_nodes(0), do: %ListNode{val: 0, next: nil}

  def to_nodes(val) do
    Stream.unfold(val, fn
      0 -> nil
      n -> {rem(n, 10), div(n, 10)}
    end)
    |> Enum.reduce(nil, &(%ListNode{val: &1, next: &2}))
  end
end
