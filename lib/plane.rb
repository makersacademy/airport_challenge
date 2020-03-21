require_relative 'airport'
require_relative 'weather'

class Plane
  def initialize
    @landed = false
    @current_airport = nil
  end

  def land(airport, weather)
    raise 'Unable to land, airport is full' if airport.full?
    raise 'Unable to land, plane has already landed' if landed?
    raise 'Unable to land, stormy weather' if weather.current_weather == Weather::STORMY

    @current_airport = airport
    @current_airport.notify_that_plane_has_landed
    @landed = true
  end

  def take_off(weather)
    raise 'Unable to take off, plane is not landed' unless landed?
    raise 'Unable to take off, stormy weather' if weather.current_weather == Weather::STORMY

    @current_airport.notify_that_plane_has_left
    @landed = false
    "No longer in the airport"
  end

  def landed?
    @landed
  end
end
