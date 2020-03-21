require_relative 'airport'

class Plane
  def initialize
    @landed = false
  end

  def land(airport)
    raise 'Unable to land, airport is full' if airport.full?
    raise 'Unable to land, plane has already landed' if landed?

    airport.land_plane
    @landed = true
  end

  def take_off
    raise 'Unable to take off, plane is not landed' unless landed?
    @landed = false
    "No longer in the airport"
  end

  def landed?
    @landed
  end
end
