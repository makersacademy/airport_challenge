require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
  end

  def land_plane plane
    fail 'Airport is full' if full?
    fail 'Weather is too stormy' if stormy?
    plane.land_at_airport
    @planes << plane
  end

  def release_plane plane
  	fail 'No planes at the airport' if empty?
  	fail 'Weather is too stormy' if stormy?
    plane.take_off
    @planes.delete(plane)
  end

  def full?
  	@planes.count >= DEFAULT_CAPACITY
  end

  def empty?
  	@planes.length == 0
  end

  def stormy?
  	rand(5) == 0
  end
end
