class Airport
  attr_reader :planes
  
  def land(plane)
    @planes = []
    @planes << plane
  end
end
