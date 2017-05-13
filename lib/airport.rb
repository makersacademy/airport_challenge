class Airport

  attr_reader :plane

  def initialize
    @plane = []
  end

  def land_plane(plane)
    @plane << plane
    #"Plane landing confirmed!"
  end

  def take_off(plane)
    @plane.pop
  end
end
