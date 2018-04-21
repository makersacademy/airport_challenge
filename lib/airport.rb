class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def lands_plane(plane)
    plane.land
    @planes << plane
  end

  def takes_off_plane(plane)
    plane.take_off
    @planes.delete(plane)
    "#{plane} not in airport" unless @planes.include?(plane)
  end

end
