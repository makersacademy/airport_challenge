class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    @planes
  end

  def take_off(plane)
    @planes.delete(plane)
    "This #{plane} has left the airport" unless @planes.include?(plane)
  end
end
