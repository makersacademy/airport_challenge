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
  # removes Planes from the Airport's @planes array,
  # and confirms that the number of Planes in the
  # @planes array has decreased by 1
    landed_planes = @planes.length
    @planes.pop
    if landed_planes.-(1) == @planes.length
      return "Flight has departed."
    end
  end
end