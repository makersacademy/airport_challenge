require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather

  attr_reader :planes, :capacity

  def initialize (capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land(plane) #creating a new method to land a plane
    raise "Weather is stormy" if stormy?
    raise "Airport full" if full?
    raise "Plane already landed" if plane.landed?
    plane.land
    @planes << plane
  end

  def take_off
    raise "Weather is stormy" if stormy?
    raise "Airport empty" if empty?
    plane = @planes.delete(@planes.sample)#creating a new instance of the plane class to take off
    plane.take_off
    plane
  end

  private
  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.empty?
  end

end
