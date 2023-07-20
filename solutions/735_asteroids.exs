defmodule Solution do
  @spec asteroid_collision(asteroids :: [integer]) :: [integer]
  def asteroid_collision(asteroids) do
    squash(asteroids, [])
  end

  def squash([], stack), do: Enum.reverse(stack)
  def squash([next | queue], []), do: squash(queue, [next])

  def squash([next | queue], [top | stack])
      when top < 0
      when next > 0 do
    squash(queue, [next, top | stack])
  end

  def squash([next | queue], [top | stack]) do
    case next + top do
      0 -> squash(queue, stack)
      n when n > 0 -> squash(queue, [top | stack])
      n when n < 0 -> squash([next | queue], stack)
    end
  end
end
