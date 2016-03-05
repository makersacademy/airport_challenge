class Airport

  attr_reader :planes

  def initialize
  @planes = []
  end


  def arrive(plane)
    @planes << plane
  end

  def depart(plane)
    @planes.delete(plane)
  end

end