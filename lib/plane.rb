require_relative 'airport'

class Plane
  attr_accessor :landed
  attr_accessor :at_airport

  def initialize
    @landed = false
    @at_airport = 'none'
  end

  def land(airport)
    fail 'Plane has already landed' if landed?
    fail 'Cannot land in stormy weather' if
    airport.weather.what_is_weather == 'stormy'
    @landed = true
    @at_airport = airport
    airport.hangar << self
  end

  def takeoff
    fail 'Plane cannot takeoff if not on ground' unless landed?
  end

  def landed?
    @landed
  end

end
