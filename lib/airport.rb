class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    plane.land
    planes << plane if plane.landed?
  end

  def take_off(plane)
    planes.pop
  end
end