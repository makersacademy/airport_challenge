require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def confirm_land
    plane = Plane.new
    planes << plane
    planes.last
  end

  def confirm_takeoff
    planes.shift # this returns the plane object that has taken off
    planes
  end
end
