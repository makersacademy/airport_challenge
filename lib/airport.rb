require 'plane'
class Airport
  attr_reader :parked_planes, :capacity
  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @parked_planes = []
    @capacity = capacity

  end

  def land_plane(flight_number = Plane.new)
    raise "airport is full" if @parked_planes.length >= @capacity

    @parked_planes << flight_number
  end

  def take_off
    @parked_planes.pop
    
  end
end
