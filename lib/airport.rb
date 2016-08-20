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
    check_space
    check_in_flight(plane)
    check_weather
    plane.ground
    planes << plane
  end

  def take_off(plane)
    check_in_airport(plane)
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

  def check_in_flight(plane)
    fail "Plane's aleady down, Sir" if plane.in_flight == false
  end

  def check_in_airport(plane)
    fail "Plane's already up there, Sir." if plane.in_flight == true
    fail "Plane's in another airport, Sir." unless planes.include? plane
  end

end
