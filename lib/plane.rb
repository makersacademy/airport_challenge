require_relative 'airport'

class Plane
  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land(airport)
    fail 'Plane has already landed' if landed?
    fail 'Cannot land in stormy weather' if airport.weather.what_is_weather == 'stormy'
    @landed = true
    airport.hangar << self
  end

  def landed?
    @landed
  end

end
