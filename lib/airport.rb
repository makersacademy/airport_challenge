class Airport
  attr_accessor :hanger

  def initialize
    @hanger = []
  end

  def land_plane(plane)
    hanger << plane
  end
end

class Plane
end
