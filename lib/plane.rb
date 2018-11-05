require_relative 'airport'

class Plane
  attr_accessor :landed
  attr_accessor :at_airport

  def initialize
    @at_airport = nil
  end

  def land(airport)
    fail 'Plane has already landed' if at_airport
    if airport.weather.what_is_weather == 'stormy'
      fail 'Cannot land in stormy weather'
    end
    fail 'Cannot land at full airport' if airport.hangar_full?
    @at_airport = airport
    airport.hangar << self
  end

  def takeoff
    fail 'Plane cannot takeoff when not on ground' unless at_airport
    unless @at_airport.weather.what_is_weather == 'sunny'
      fail 'Plane cannot takeoff when weather is stormy'
    end
    @at_airport.hangar.delete(self)
    @at_airport = nil
  end

end
