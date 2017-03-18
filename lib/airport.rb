require 'plane.rb'
require 'weather.rb'

class Airport

  attr_reader :planes, :capacity

  DEFAULY_CAPACITY = 10
  def initialize(capacity = DEFAULY_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def accept(plane)
    raise 'Airport full!' if full?
    raise 'Weather is too stormy!' if Weather::Weather == 'stormy'
    planes << plane
    Plane.land(plane)
  end

  def release(plane)
    raise 'Airport empty!' if empty?
    raise 'Weather is too stormy' if Weather::Weather == 'stormy'
    Plane.takeoff(plane)
    planes.slice!(planes.index(plane))
  end

  private

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

end
