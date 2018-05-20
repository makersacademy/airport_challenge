class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def add_plane(plane)
    @planes << plane
  end
  
end
