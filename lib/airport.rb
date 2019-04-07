require_relative 'plane'

class Airport

  DEAFAULT_CAPACITY = 50

  def initialize(capacity = DEAFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land_plane(plane)
    fail "Airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    plane
  end

  def full?
    @planes.count >= 50
  end
end
