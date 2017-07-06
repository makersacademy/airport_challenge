require_relative 'plane'

class Airport

  attr_accessor :plane

  # Write up an initialize test
  def initialize
    @airport = []
  end

  def land_plane(plane)
    # p "Plane: #{plane.object_id } has landed"
    @airport << plane
  end

end
