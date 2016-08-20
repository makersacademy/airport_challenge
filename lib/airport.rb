require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Ach no, there's a storm a-brewin'!" if bad_weather?
    fail "Sorry, we've got more planes that you can shake a stick at." if full?
    plane.ground
    planes << plane
  end

  def take_off(plane)
    fail "Ach no, there's a storm a-brewin'!" if bad_weather?
    plane.fly
    planes.delete(plane)
  end

private

  def bad_weather?
    Weather.new.stormy
  end

  def full?
    planes.count >= capacity
  end

end
