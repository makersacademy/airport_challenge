class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def track_plane(plane)
    @planes << plane
  end

end
