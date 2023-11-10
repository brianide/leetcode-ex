defmodule Solution do
  @spec restore_array(adjacent_pairs :: [[integer]]) :: [integer]
  def restore_array(pairs) do
    graph =
      Enum.reduce(pairs, %{}, fn [a, b], graph ->
        graph
        |> Map.update(a, [b], &[b | &1])
        |> Map.update(b, [a], &[a | &1])
      end)

    Enum.find_value(graph, fn {a, [b]} -> [b, a]; _ -> nil end)
    |> rebuild(graph)
  end

  def rebuild([curr, prev | _] = list, graph) do
    case graph[curr] do
      [^prev] -> list
      [^prev, a] -> rebuild([a | list], graph)
      [a, ^prev] -> rebuild([a | list], graph)
    end
  end
end
