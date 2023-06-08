defmodule Solution do
  @spec find_circle_num(is_connected :: [[integer]]) :: integer
  def find_circle_num(is_connected) do
    to_adjacency_list(is_connected)
    |> count_islands()
  end

  def to_adjacency_list(mat) do
    Enum.with_index(mat, fn bits, i ->
      Enum.with_index(bits)
      |> Enum.filter(fn {conn, j} -> i != j && conn == 1 end)
      |> Enum.map(&elem(&1, 1))
      |> then(&({i, &1}))
    end)
    |> Enum.reduce(%{}, fn {i, adj}, acc -> Map.put(acc, i, adj) end)
  end

  def count_islands(adj), do: count_islands(adj, 0, [], MapSet.new(Map.keys(adj)))

  def count_islands(adj, count, [], unvisited) do
    case Enum.at(unvisited, 0) do
      nil -> count
      n -> count_islands(adj, count + 1, [n], MapSet.delete(unvisited, n))
    end
  end

  def count_islands(adj, count, queue, unvisited) do
    {queue, unvisited} =
      Enum.reduce(queue, {[], unvisited}, fn dest, {queue, unvisited} ->
        next = Enum.filter(adj[dest], &(&1 in unvisited))
        queue = next ++ queue
        unvisited = Enum.reduce(next, unvisited, &MapSet.delete(&2, &1))
        {queue, unvisited}
      end)
    count_islands(adj, count, queue, unvisited)
  end
end
