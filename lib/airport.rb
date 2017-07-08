class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def has_landed?(plane)
    @planes.include?(plane)
  end
end
