require './lib/plane.rb'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes.push(plane)
  end

  def take_off_plane(plane)
    @planes.delete(plane)
  end
end
