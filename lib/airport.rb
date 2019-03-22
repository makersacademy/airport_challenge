require_relative 'weather'

class Airport
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_on_runway(plane)
    fail "Airport at capacity" if full?
    
    planes << plane
  end

  def take_off_from_runway(plane)
    plane_position = planes.index(plane)
    planes.slice!(plane_position)
  end

  def full?
    planes.count >= capacity
  end

end
