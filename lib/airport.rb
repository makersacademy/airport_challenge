class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def accept(plane)
    raise "This plane is not currently flying." if plane.landed?
    plane.land
    planes << plane
  end

end
