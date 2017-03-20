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
    accept_check(plane)
    planes << plane
    plane.land
  end

  def release(plane)
    release_check(plane)
    plane.takeoff
    planes.slice!(planes.index(plane))
  end

  private

  def accept_check(plane)
    raise 'Plane has already landed!' unless plane.flying
    raise 'Plane is already in the airport!' if planes.include?(plane)
    raise 'Airport full!' if full?
    raise 'Weather is too stormy!' if stormy?
  end

  def release_check(plane)
    raise 'Plane is already flying!' if plane.flying
    raise 'Airport empty!' if empty?
    raise 'Weather is too stormy!' if stormy?
  end

  def stormy?
    Weather.stormy?
  end

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

end
