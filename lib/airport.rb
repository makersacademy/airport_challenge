require 'plane'

class Airport

  attr_reader :airbourne_planes

  def initialize
    @airbourne_plane = Plane.new(1)
    @landed_plane = []
  end

  def land_plane
  end

end

# test = Airport.new
# puts test.airbourne_planes
