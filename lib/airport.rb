class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def plane_lands(plane)
    @planes << plane
  end

end
