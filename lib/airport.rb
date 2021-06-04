require_relative 'plane.rb'
class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land_plane(plane)
    fail 'Airport at maximum capacity, cannot land plane' if full?
    @hangar << plane
  end

  def take_off_plane(plane)
    "Plane has left the airport"
  end


private
  def full?
    @hangar.count >= @capacity
  end

end
# plane = Plane.new
# take_off(plane)
