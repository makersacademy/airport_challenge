require './lib/plane.rb'

# Airport class will store and instruct
# instances of the Plane class
class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end
  def land_plane(plane)
    @planes << plane
  end
  def take_off
    @planes.pop
  end
end