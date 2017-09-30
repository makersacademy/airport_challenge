class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end
  def land(plane)
    @planes << plane
  end
  def take_off(plane)
    departed? @planes.pop
  end
  def departed?(plane)
    !@planes.include?(plane)
  end
end
