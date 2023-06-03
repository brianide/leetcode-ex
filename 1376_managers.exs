defmodule Solution do
  @spec num_of_minutes(n :: integer, head_id :: integer, manager :: [integer], inform_time :: [integer]) :: integer
  def num_of_minutes(n, head_id, manager, inform_time) do
    Enum.zip([manager, Range.new(0, n - 1), inform_time])
    |> Enum.group_by(&elem(&1, 0), &Tuple.delete_at(&1, 0))
    |> inform_subs()
  end

  def inform_subs(subs_of), do: inform_subs(subs_of, {-1, 0})
  def inform_subs(subs_of, {id, time}) do
    case subs_of[id] do
      nil -> 0
      n -> Enum.map(n, &inform_subs(subs_of, &1)) |> Enum.max() |> then(&(&1 + time))
    end
  end
end
