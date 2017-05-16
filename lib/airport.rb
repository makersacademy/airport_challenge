require_relative 'plane'
require_relative 'weather'

DEFAULT_CAPACITY = 20

class Airport

attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise "Landing unathorised: unsafe weather conditions" if stormy?
    raise "Landing unauthorised: airport full" if full?
    @planes << plane
  end

  def take_off(plane)
    raise "Take-off unathorised: unsafe weather conditions" if stormy?
    @planes.delete(plane)
  end

  private

  def stormy?
    @weather.stormy?
  end

  def full?
    @planes.length >= @capacity
  end

end
