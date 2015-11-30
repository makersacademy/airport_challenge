require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50

  include Weather

  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'Weather is stormy' if bad_weather?
    plane.not_flying
    @planes << plane
  end

  def takeoff(plane)
    fail 'Airport is empty' if empty?
    fail 'Weather is stormy' if bad_weather?
    plane.flying
    @planes.delete(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end

  def bad_weather?
    weather? == :stormy
  end
end
