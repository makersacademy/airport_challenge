require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity, :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def request_land(plane)
    plane.land
    @planes << plane
  end

  def request_takeoff(plane)
    plane.takeoff
  end


end
