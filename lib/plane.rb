require 'weather'

class Plane

  def initialize(airport = nil, weather = Weather.new)
    @airport = airport
    @weather = weather
  end

  def land(airport)
    @airport = airport
    true
  end

  def take_off
    fail 'It is too stormy to take off' if @weather.forecast == :stormy
    @airport = nil
  end

end
