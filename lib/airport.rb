class Airport
  def initialize
    @planes = []
  end
  def land(plane)
    @planes << plane
    p @planes.delete(plane)
  end
end
