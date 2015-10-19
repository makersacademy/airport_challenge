require_relative 'plane'

class Airport
  include Weather

  DEFAULT_CAPACITY = 1
  attr_reader :planes, :capacity

  def initialize( capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land plane
    raise StandardError, 'Airport is full' unless !full?
    raise StandardError,'Weather is stormy' if stormy?
    raise StandardError, 'Plane is not flying' if plane.flying == false
    plane.landed
    @planes << plane
  end

  def take_off plane
    raise StandardError,'Weather is stormy' if stormy?
    raise StandardError,'The plane is not in this airport' unless @planes.include?(plane)
    raise StandardError,'Plane is already flying'if plane.flying == true
    plane.fly
    @planes.pop
  end

  private

  def full?
    @planes.length == @capacity
  end
end
