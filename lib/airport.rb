class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def airstrip_land(plane)
    @planes << plane
  end

  def airstrip_take_off(plane)
    @planes.delete(plane)
  end
end
