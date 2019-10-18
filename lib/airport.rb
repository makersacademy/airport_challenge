class Airport
  attr_reader :planes

  def initialize
    @Planes = []
  end

  def land(plane)
    @Planes << plane
  end

  def airbourne(plane)
    @planes.pop
  end
end