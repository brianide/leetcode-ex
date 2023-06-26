defmodule PQueue do
  def new(list), do: Enum.reduce(list, :gb_trees.empty(), &add(&2, &1))
  def add(q, val), do: :gb_trees.enter(val + :rand.uniform(), val, q)
  def smallest(q), do: :gb_trees.smallest(q) |> elem(1)
  def take_smallest(q), do: :gb_trees.take_smallest(q) |> Tuple.delete_at(0)
  def to_list(qs), do: Enum.flat_map(qs, &:gb_trees.values/1) |> Enum.sort()
end

defmodule CandQueue do
  defp new(costs, cand) do
    qlen = length(costs) - cand * 2
    if qlen > 0 do
      {left, middle} = Enum.split(costs, cand)
      {lq, right} = Enum.split(middle, qlen)
      rq = Enum.reverse(lq)
      left = PQueue.new(left)
      right = PQueue.new(right)
      {:split, qlen, {left, lq}, {right, rq}}
    else
      {:cont, Enum.sort(costs)}
    end
  end

  defp next({:cont, []}), do: nil
  defp next({:cont, [head | more]}), do: {head, {:cont, more}}

  defp next({:split, 0, {left, _}, {right, _}}) do
    [head | more] = PQueue.to_list([left, right])
    {head, {:cont, more}}
  end

  defp next({:split, qlen, {left, lq}, {right, rq}}) do
    qlen = qlen - 1
    {side, set, [head | more]} =
      if PQueue.smallest(right) < PQueue.smallest(left) do
        {:right, right, rq}
      else
        {:left, left, lq}
      end

    {sm, set} = PQueue.take_smallest(set)
    set = PQueue.add(set, head)

    acc =
      {
        :split,
        qlen,
        (if side === :left, do: {set, more}, else: {left, lq}),
        (if side === :right, do: {set, more}, else: {right, rq})
      }
    {sm, acc}
  end

  def make_stream(costs, cand) do
    Stream.unfold(new(costs, cand), &next/1)
  end
end

defmodule Solution do
  @spec total_cost(costs :: [integer], k :: integer, candidates :: integer) :: integer
  def total_cost(costs, k, cand) do
    CandQueue.make_stream(costs, cand)
    |> Enum.take(k)
    |> Enum.sum()
  end
end
