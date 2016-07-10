require_relative "plane"
require_relative "weather"

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

  def take_off(plane)
    fail "No planes" unless find(plane)
    plane.fly
    remove(plane)
  end

  #private

  def flying?(plane)
    plane.landed?
  end

  def find(plane)
    @planes.include?(plane)
  end

  def remove(plane)
    @planes.delete(plane)
  end

end
