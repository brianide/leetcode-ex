defmodule Grid do
  def from_rows(rows) do
    grid = Enum.flat_map(rows, fn n -> n end) |> :array.from_list()
    {grid, :array.size(grid) |> :math.sqrt() |> ceil()}
  end

  def get_neighbors({grid, size}, visited, {row, col}) do
    for r <- -1..1,
        c <- -1..1,
        r != 0 || c != 0,
        row = row + r,
        col = col + c,
        row >= 0 && row < size,
        col >= 0 && col < size,
        not {row, col} in visited,
        :array.get(row * size + col, grid) == 0 do
      {row, col}
    end
  end

  def get_endpoint({_, size}), do: {size - 1, size - 1}
end

defmodule Solution do
  @spec shortest_path_binary_matrix(grid :: [[integer]]) :: integer
  def shortest_path_binary_matrix([[1 | _] | _]), do: -1

  def shortest_path_binary_matrix(grid) do
    Grid.from_rows(grid) |> bfs()
  end

  def bfs(grid), do: bfs(grid, 1, [{0, 0}], MapSet.new([{0, 0}]))

  def bfs(_, _, [], _), do: -1

  def bfs(grid, depth, queue, visited) do
    if Grid.get_endpoint(grid) in visited do
      depth
    else
      {next, visited} =
        Enum.reduce(queue, {[], visited}, fn pos, {queue, visited} ->
          neighbors = Grid.get_neighbors(grid, visited, pos)
          queue = neighbors ++ queue
          visited = Enum.reduce(neighbors, visited, &MapSet.put(&2, &1))
          {queue, visited}
        end)
      bfs(grid, depth + 1, next, visited)
    end
  end
end
