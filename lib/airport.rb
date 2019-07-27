require 'weather'

class Airport
  attr_reader :tarmac

  def initialize(weather_forecast= Weather.new)
    @tarmac = []
    @local_weather = weather_forecast
  end

  def order_take_off(plane)
    raise "Planes grounded, the weather doesn't allow for take-offs!" if @local_weather.stormy?
    plane.take_off
    @tarmac.delete(plane)
  end

  def order_landing(plane)
    plane.land
    @tarmac << plane
  end

  def prevent_take_off
  end

  def prevent_landing
  end

end
