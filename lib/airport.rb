require_relative 'plane'

class Airport
  DEFAULT_TAKE_OFF_MESSAGE = 'The plane has left the airport'
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if @planes.count >= DEFAULT_CAPACITY
    @planes << plane
  end

  def take_off(plane)
    DEFAULT_TAKE_OFF_MESSAGE
    @planes.delete(plane)
  end

  def plane

  end
end