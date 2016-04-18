require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :plane

DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY, plane = Plane.new)
    @planes = []
    @capacity = capacity
    @plane = plane
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'Too windy to land' if stormy?
    fail 'Plane not flying' unless flying?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail 'Airport is empty' if empty?
    fail 'Too windy to take off' if stormy?
    fail 'Plane already flying' if flying?
    fail 'Plane not here' unless @planes.include?(plane)
    plane.take_off
    @planes.delete(plane)
  end

  def flying?
    plane.flying?
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