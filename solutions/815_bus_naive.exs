defmodule Solution do
  @spec num_buses_to_destination(routes :: [[integer]], source :: integer, target :: integer) :: integer
  def num_buses_to_destination(routes, source, target) do
    for route <- routes,
        a <- route,
        b <- route,
        a != b,
        reduce: %{} do
      acc -> Map.update(acc, a, [b], &[b | &1])
    end
    |> bfs(target, 0, [source], MapSet.new([source]))
  end

  def bfs(_, _, _, [], visited), do: -1

  def bfs(graph, target, depth, queue, visited) do
    Enum.reduce_while(queue, {[], visited}, fn
      e, _ when e == target ->
        {:halt, depth}
      e, {queue, visited} ->
        for n <- graph[e],
            not MapSet.member?(visited, n),
            reduce: {queue, visited} do
          {queue, visited} -> {[n | queue], MapSet.put(visited, n)}
        end
        |> then(&{:cont, &1})
    end)
    |> case do
      {queue, visited} -> bfs(graph, target, depth + 1, queue, visited)
      n -> n
    end
  end
end
