require_relative "plane"

class Airport

  def initialize(capacity = 5, weather = ["stormy", "sunny", "sunny", "sunny", "sunny"].sample)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land_plane(plane)
    fail "The airport is full" if full?

    @planes << plane
  end

  def take_off
    fail "No take-off due to poor weather" if @weather == "stormy"
    return "The plane has left"
  end

  def full?
    @planes.count >= @capacity
  end

end
