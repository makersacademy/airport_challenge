require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  CAPACITY = 10

  def initialize(capacity = CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def dock(plane, weather)
    check_weather(weather)
    full?
    planes << plane
  end

  def check_for_landed(plane)
    planes.include? plane
  end

  def release(plane, weather)
    check_weather(weather)
    planes.delete(plane)
  end

  def check_weather(weather)
    fail 'No planes can land or take off in a storm' if weather.stormy?
  end

private

  def full?
    fail 'Airport is at full capacity' if planes.count >= capacity
  end
end
