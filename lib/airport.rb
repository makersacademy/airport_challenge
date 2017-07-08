require 'plane'
require 'weather'

class Airport

  include Weather
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land plane
    raise "Landing prevented due to stormy weather" if stormy?
    raise 'Airport is full' if full?
    plane.land
    raise 'Problem with landing' if plane.status != "In Airport"
    planes << plane
  end

  def take_off plane
    raise "Take off prevented due to stormy weather" if stormy?
    plane.take_off
    raise 'Problem with take off' if plane.status != "Flying"
    planes.delete(plane)
  end

  private

  def full?
    planes.count == capacity
  end

end
