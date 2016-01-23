class Airport

  def initialize
    @landed_planes = []
  end

  def clear_to_land(plane)
    @landed_planes << plane
  end
end
