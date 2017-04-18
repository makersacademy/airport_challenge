require "plane"
require "weather"

class Airport

  attr_reader :capacity, :planes

  DEFAULT_CAPACITY = 100

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes= []
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Stormy cannot land" if stormy?
    planes << plane
  end

  def take_off
    fail "Cannot take off" if stormy?
    planes.pop
  end

  private

  def stormy?(weather = Weather.new)
    weather.stormy?
  end

  def full?
    planes.count >= capacity
  end

end