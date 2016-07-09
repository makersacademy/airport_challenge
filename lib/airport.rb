class Airport

attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.location = :airport
    @planes << plane

  end

  def take_off(plane)
    raise "Error: that plane isn't at this airport" unless @planes.include? plane
    plane.location = :air
    @planes.delete(plane)


  end

end
