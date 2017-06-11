require_relative "../lib/plane.rb"

class Airport

attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Plane already landed" if planes.include?(plane)
    plane.land
    planes << plane
  end

  def take_off(plane)
    raise "Plane not in airport" if !planes.include?(plane)
    @planes.delete(plane)
    plane.fly
  end

end
