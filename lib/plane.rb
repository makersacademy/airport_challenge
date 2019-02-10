require_relative 'airport.rb'
class Plane
  attr_reader :location
  attr_writer :location
  def initialize
    @location = 'flying'
  end

  def land(airport)
    fail "This plane has already landed" if landed?

    airport.land_plane(self)
  end

  def takeoff(airport)
    fail "This plane is already flying" if landed? == false

    airport.takeoff_plane(self)
    @location = 'flying'
  end
private
  def landed?
    return false unless @location != 'flying'

    true
  end
end
