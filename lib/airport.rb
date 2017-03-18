require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :planes, :capacity

  DEFAULY_CAPACITY = 10
  def initialize(capacity = DEFAULY_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def accept(plane)
    raise 'Plane has already landed!' if plane.flying == false
    raise 'Plane is already in the airport!' if planes.include?(plane)
    raise 'Airport full!' if full?
    raise 'Weather is too stormy!' if Weather::Weather == 'stormy'
    planes << plane
    plane.land
  end

  def release(plane)
    raise 'Plane is already flying!' if plane.flying == true
    raise 'Airport empty!' if empty?
    raise 'Weather is too stormy' if Weather::Weather == 'stormy'
    plane.takeoff
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
