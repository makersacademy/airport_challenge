require 'weather'

class Airport
  attr_reader :tarmac, :capacity

  def initialize(weather_forecast = Weather.new, tarmac = [], capacity = 20)
    @tarmac = tarmac
    @local_weather = weather_forecast
    @capacity = capacity
  end

  def order_take_off(plane)
    clear_for_take_off
    plane.take_off
    @tarmac.delete(plane)
  end

  def order_landing(plane)
    clear_for_landing
    plane.land
    @tarmac << plane
  end

  def clear_for_take_off
    raise "The weather doesn't allow for take-offs!" if @local_weather.stormy?
  end

  def clear_for_landing
    raise "Too dangerous to land in this weather!" if @local_weather.stormy?
    raise "Landing denied, airport is full." if full?
  end

  private
  def full?
    @tarmac.count >= @capacity
  end

end
