class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def plane_takeoff
    raise "Airport is empty." if empty?
    @planes[0]
    @planes.delete_at(0)
  end

  def empty?
    @planes.empty?
  end

end
