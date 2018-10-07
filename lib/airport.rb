class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def add_plane(plane)
    fail 'Plane is already at an airport!' if @planes.include?(plane)
    @planes << plane
    plane
  end

end
