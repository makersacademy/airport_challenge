require_relative "plane"

class Airport

  def initialize(capacity = 5)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    fail "The airport is full" if full?

    @planes << plane
  end

  def take_off
    return "The plane has left"
  end

  def full?
    @planes.count >= @capacity
  end

end
