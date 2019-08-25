AIRPORT_CAPACITY = 100

class Airport

  attr_accessor :planes

  def initialize(weather, capacity = AIRPORT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def instruct_landing(plane)
    fail "Stormy conditions" if stormy?
    fail "Airport full" if full?
    plane.land
    @planes << plane
  end

  def instruct_take_off(plane)
    fail "Stormy conditions" if stormy?
    plane.take_off
    @planes.pop
  end

private

  def stormy?
    @weather.weather_condition == :stormy
  end

  def full?
    @planes.length == @capacity
  end

end
