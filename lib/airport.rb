class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def landing(plane)
    planes << plane
  end

end