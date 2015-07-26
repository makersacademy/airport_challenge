require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def call_landing(plane)
    plane.land
    @planes << plane
    plane
  end

  def call_takeoff
    flying_plane = planes.pop
    flying_plane.takeoff
    flying_plane
  end
  
end
