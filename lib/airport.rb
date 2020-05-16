class Airport
  def initialize
    @planes_in = []
  end

  def land(plane)
    @planes_in << plane
  end
end
