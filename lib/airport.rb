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
    check_weather
    check_space
    plane.ground
    planes << plane
  end

  def take_off(plane)
    check_weather
    plane.fly
    planes.delete(plane)
  end

private

  def check_weather
    fail "Ach no, there's a storm a-brewin'!" if bad_weather?
  end

  def bad_weather?
    Weather.new.stormy
  end

  def check_space
    fail "Sorry, we've got more planes that you can shake a stick at." if full?
  end

  def full?
    planes.count >= capacity
  end

end
