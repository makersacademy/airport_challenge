require_relative 'Plane.rb'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.ground
    self.planes. << plane
  end

  def takeoff(plane)
    plane.fly
    index = planes.find_index { |airplane| airplane = plane }
    planes[index]
    planes.delete_at(index)
  end

end
