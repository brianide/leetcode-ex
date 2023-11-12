defmodule Solution do
  @spec num_buses_to_destination(routes :: [[integer]], source :: integer, target :: integer) :: integer
  def num_buses_to_destination(_, source, target) when source == target, do: 0

  def num_buses_to_destination(routes, source, target) do
    table = Enum.with_index(routes, &{&2, Enum.sort(&1)}) |> Map.new()
    keys = 0 .. map_size(table) - 1
    graph =
      for a <- keys,
          b <- keys,
          a != b,
          share_element?(table[a], table[b]),
          reduce: Map.new(keys, &{&1, []}) do
        acc -> Map.update!(acc, a, &[b | &1])
      end

    start = for i <- keys, source in table[i], do: i
    finish = for i <- keys, target in table[i], into: MapSet.new(), do: i

    bfs(graph, finish, 1, start, MapSet.new(start))
  end

  defp share_element?([a | _], [b | _]) when a == b, do: true
  defp share_element?([], _), do: false
  defp share_element?(_, []), do: false
  defp share_element?([a | more], [b | _] = list) when a < b, do: share_element?(more, list)
  defp share_element?([a | _] = list, [b | more]) when a > b, do: share_element?(more, list)

  defp bfs(_, _, _, [], visited), do: -1

  defp bfs(graph, finish, depth, queue, visited) do
    Enum.reduce_while(queue, {[], visited}, fn e, {queue, visited} ->
      if e in finish do
        {:halt, depth}
      else
        for n <- graph[e],
            n not in visited,
            reduce: {queue, visited} do
          {queue, visited} -> {[n | queue], MapSet.put(visited, n)}
        end
        |> then(&{:cont, &1})
      end
    end)
    |> case do
      {queue, visited} -> bfs(graph, finish, depth + 1, queue, visited)
      n -> n
    end
  end
end
