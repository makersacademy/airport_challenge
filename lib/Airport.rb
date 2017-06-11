require_relative 'Plane.rb'

class Airport

  attr_accessor :planes

  DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if full?
    plane.ground
    self.planes. << plane
  end

  def takeoff(plane)
    plane.fly
    index = planes.find_index { |airplane| airplane = plane }
    planes[index]
    planes.delete_at(index)
  end

private

  def full?
    self.planes.length == DEFAULT_CAPACITY
  end

end
