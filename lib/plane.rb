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
    if airport.weather.what_is_weather == 'stormy'
      fail 'Cannot land in stormy weather'
    end
    @landed = true
    @at_airport = airport
    airport.hangar << self
  end

  def takeoff
    fail 'Plane cannot takeoff when not on ground' unless landed?
    unless @at_airport.weather.what_is_weather == 'sunny'
      fail 'Plane cannot takeoff when weather is stormy'
    end
    @at_airport.hangar.delete(self)
    @landed = false
    @at_airport = 'none'
  end

  def landed?
    @landed
  end

end
