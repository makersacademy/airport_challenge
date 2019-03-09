class Airport
  attr_reader :planes
  
  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def launch_plane(plane)
    @planes.reject do |item|
      item == plane
    end
  end
end