require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :planes, :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Too stormy to land" if stormy_weather?
    fail "Airport full! No space to land" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "Too stormy for take off" if stormy_weather?
    plane = @planes.pop
  end

  private
  def stormy_weather?
    Weather.new.stormy?
  end

  def full?
    @planes.length >= @capacity
  end
end
