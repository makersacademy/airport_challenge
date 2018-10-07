class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    "#{plane} landed at Arrival"
  end

  def arrival
    @planes
  end
end
