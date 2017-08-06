(class Airport

  attr_reader :plane, :planes

  def initialize
    @plane = plane
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
    plane
  end

  def takeoff
    raise 'No planes available' if @planes.empty?
    @takeoff = @planes[0]
    @planes.delete_at(0)
    @takeoff
  end

end)