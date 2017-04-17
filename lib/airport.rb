require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @planes = []
  end

  def confirm_landed(plane)
    @planes << plane
  end

  def confirm_take_off
    fail 'Cannot takeoff in stormy weather' if weather_status?
    @planes.pop
  end

  def weather_status?
    weather = Weather.new
    weather.stormy?
  end

end
