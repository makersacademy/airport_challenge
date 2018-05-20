class Airport
  attr_reader :planes

  # initialize the airport
  def initialize
    @planes = []
  end

  # add a plane to the plane array
  def add_plane(plane)
    @planes << plane
  end

end
