require_relative 'weather'
require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def land(plane)
    fail "No landings allowed due to bad weather" if stormy?
    fail "Airport is full" if full?
    fail "Plane has already landed" if present?(plane)

    plane.landed?
    @landed_planes << plane
  end

  def takeoff(plane)
    fail "No take offs allowed due to bad weather" if stormy?
    fail "This plane has not landed" unless present?(plane)

    @landed_planes.delete(plane)
    plane.flying?
    "#{plane} has left the Airport"
  end

  def present?(plane)
    @landed_planes.include?(plane)
  end

  private
  def full?
    @landed_planes.count >= @capacity
  end

  def stormy?
    Weather.stormy?
  end

end
