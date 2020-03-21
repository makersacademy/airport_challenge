require_relative 'airport'
require_relative 'weather'

class Plane
  def initialize
    @landed = false
    @current_airport = nil
  end

  def land(airport)
    raise 'Unable to land, airport is full' if airport.full?
    raise 'Unable to land, plane has already landed' if landed?

    @current_airport = airport
    @current_airport.land_plane
    @landed = true
  end

  def take_off(current_weather)
    raise 'Unable to take off, plane is not landed' unless landed?
    raise 'Unable to take off, stormy weather' if current_weather == Weather::STORMY

    @current_airport.launch_plane
    @landed = false

    "No longer in the airport"
  end

  def landed?
    @landed
  end
end
