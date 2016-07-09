class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def accept(plane)
    @planes << plane
    plane.dock
  end

end
