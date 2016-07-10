require_relative "plane"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Plane has already landed" if flying?(plane)
    plane.land_plane
    planes.push(plane)
  end

  def take_off
    fail "No planes" if @planes.empty?
    plane = planes.pop
    plane.fly
  end

  def flying?(plane)
    plane.landed?
  end

end
