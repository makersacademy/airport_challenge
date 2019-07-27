require 'weather'

class Airport
  attr_reader :tarmac, :capacity

  def initialize(weather_forecast = Weather.new, tarmac = [], capacity = 20)
    @tarmac = tarmac
    @local_weather = weather_forecast
    @capacity = capacity
  end

  def order_take_off(plane)
    clear_for_take_off(plane)
    plane.take_off(self)
    @tarmac.delete(plane)
  end

  def order_landing(plane)
    clear_for_landing(plane)
    plane.land(self)
    @tarmac << plane
  end

  private

  def clear_for_take_off(plane)
    raise "The weather doesn't allow for take-offs!" if @local_weather.stormy?
    raise "This plane is not landed at this airport" if plane.current_airport != self
  end

  def clear_for_landing(plane)
    raise "Too dangerous to land in this weather!" if @local_weather.stormy?
    raise "Landing denied, airport is full." if full?
    raise "Can't make a plane land when it's not flying." unless plane.flying?
  end

  def full?
    @tarmac.count >= @capacity
  end

end
