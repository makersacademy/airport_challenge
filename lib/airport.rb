require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land plane
    fail 'Unable to land due to stormy weather' if weather.stormy?
    fail 'Unable to land cause airport is full' if full?
    plane.land
    planes << plane
  end

  def take_off plane
    fail 'Unable to take off due to stormy weather' if weather.stormy?
    plane.take_off
    planes.delete(plane)
  end

  private

  attr_reader :weather

  def full?
    planes.size >= capacity
  end

end
