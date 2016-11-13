require_relative 'plane.rb'

class Airport

  CAPACITY = 100

  def initialize
    @planes = []
    @capacity = CAPACITY
  end

  def plane_count
    @planes.count
  end

  def accept_plane(plane)
    raise "Error: The airport is full!" if full?
    @planes << plane
    "A plane has landed!"
  end

  def release_plane(plane)
    raise "Error: The airport is empty!" if empty?
    @planes.pop
    "A plane has taken off!"
  end

  def full?
    plane_count >= @capacity ? true : false
  end

  def empty?
    plane_count == 0 ? true : false
  end

end
