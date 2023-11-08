defmodule Solution do
  @spec is_reachable_at_time(sx :: integer, sy :: integer, fx :: integer, fy :: integer, t :: integer) :: boolean
  def is_reachable_at_time(sx, sy, fx, fy, t) when sx == fx and sy == fy and t == 1 do
    false
  end

  def is_reachable_at_time(sx, sy, fx, fy, t) do
    max(abs(fx - sx), abs(fy - sy)) <= t
  end
end
