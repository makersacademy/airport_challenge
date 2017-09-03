require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail "airport full" if full?
    fail "cannot land when stormy" if @weather.stormy?
    plane.land
    @planes << plane
    return plane
  end

  def take_off(plane)
    plane.take_off
  end

  def full?
    @planes.length >= @capacity
  end

end
