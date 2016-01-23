class Airport

  def initialize
    @planes = []
  end

  def clear_to_land(plane)
    @planes << plane
  end
end
