require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    plane.on_ground
    planes << plane
  end

  def take_off
    planes.each{|plane|
      plane.in_air
      return planes.shift
    }
  end
end
