require_relative "plane"

class Airport
  attr_accessor :plane

  def initialize 
    @planes = []
  end

  def can_land
    true
  end

  def land(plane)
    @planes = plane
  end

  def take_off
    "Plane has left the airport" if @planes.count.zero?
    @planes.pop
  end

end
