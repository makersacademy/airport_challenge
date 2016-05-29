require_relative 'plane.rb'
require_relative 'weather.rb'


class Airport

attr_accessor :capacity

DEFAULT_CAPACITY = 100
AIRPORT_CODE = "AMS"

def initialize(capacity=DEFAULT_CAPACITY)
  @capacity = capacity
  @planes = []
end


  def land(plane)
    fail "Airport full" if full?
    fail "Impossible to land" if stormy?
    fail "Plane already landed" if planes.include?(plane)
    planes << plane
    landed_plane = planes.last
    landed_plane.arrival
    landed_plane.origin = AIRPORT_CODE
    "Plane #{plane} landed successfully"
  end

  def take_off(plane)
    fail "Airport empty" if empty?
    fail "Impossible to take off" if stormy?
    fail "Plane not in airport" unless @planes.include?(plane)
    flying_plane = @planes.delete(plane)
    flying_plane.departure
    "Plane #{plane} took off successfully"
  end

  private

  attr_reader :planes

  def stormy?
    Weather.new.check_storm
  end

  def full?
    planes.length >= DEFAULT_CAPACITY
  end

  def empty?
    planes.empty?
  end

end
