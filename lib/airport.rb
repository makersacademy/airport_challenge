class Airport

  attr_reader :plane

  def initialize
    @plane = []
  end

  def landed(plane)
    @plane.push plane
    return @plane
  end

  def takenoff(plane)
    @plane.delete plane
    return @plane
  end

end
