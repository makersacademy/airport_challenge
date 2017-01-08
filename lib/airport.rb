require_relative 'weather'

class Airport
  CAPACITY = 3
  attr_reader :planes

  def initialize(capacity = CAPACITY, weather = Weather.new, planes = [])
    @capacity = capacity
    @weather = weather
    @planes = planes
  end

  def stormy?
    @weather == :stormy
  end

  def full?
    @planes.count == @capacity
  end

  def land(plane)
    fail "Sorry, no landings during stormy weather!" if stormy?
    fail "Airport is full, please head to LCY." if full?
    @planes << plane
  end

  def takeoff(plane)
    fail "Sorry, no takeoffs during stormy weather!" if stormy?
    @planes.delete(plane)
  end

end
