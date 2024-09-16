require_relative "Airport"
class Plane
  attr_reader :space, :airport, :add_plane, :hangar
  def initialize(plane)
    @plane = plane
    @airport = Airport.new("Heathrow")
  end

  def land(plane)
    @airport.space? ? @airport.add_plane(plane) : (raise "No space!")
  end

  def take_off(plane)
    @airport.status.include?(plane) ? @airport.remove_plane(plane) : (raise "Plane not present")
  end

  def takeoff_confirmation
    "Plane has taken off"
  end
end
