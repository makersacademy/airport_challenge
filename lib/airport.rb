require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 200
  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Bad weather conditions!" if stormy?
    fail "No landing slots available!" if full?
    @planes << plane
    @planes[0]
  end

  def take_off(plane)
    fail "Bad weather conditions!" if stormy?
    @planes.pop
  end

  private

  attr_reader :weather

  def full?
    @planes.count >= capacity
  end

end
