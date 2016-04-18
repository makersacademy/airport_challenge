require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'Too windy to land' if stormy?
    #fail 'Plane not flying' unless plane.flying?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail 'Airport is empty' if empty?
    fail 'Too windy to take off' if stormy?
    #fail 'Plane already flying' if plane.flying?
    #fail 'Plane in different airport' unless @planes.include?(plane)
    plane.take_off
    @planes.delete(plane)
  end

private

  def stormy?
    Weather.stormy?
  end

  def full?
    @planes.size >= capacity
  end

  def empty?
    @planes.empty?
  end

end