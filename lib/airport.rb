require_relative 'plane.rb'
class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land_plane(plane)
    raise 'Airport at maximum capacity, cannot land plane' if full?
    raise 'Cannot land plane due to storm' if stormy?
      # plane.flying = false
      @hangar << plane
      "Plane landed"
  end

  def take_off_plane(plane)
    fail 'Cannot take off due to storm' if stormy?
    fail 'No planes at the airport' if @hangar.empty?
    @hangar.pop
    "Plane has left the airport"
  end

  def current_occupancy
    @hangar.count
  end

private

  def full?
    current_occupancy >= @capacity
  end

  def stormy?
    rand(1..10) == 10
  end

end

# airport = Airport.new
# puts airport.stormy?
# plane = Plane.new
# airport.land_plane(plane)
