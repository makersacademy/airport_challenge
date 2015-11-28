class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land plane
    fail 'That is not a plane!' if plane.class != Plane
    planes << plane
    self
  end

  def takeoff plane
    fail 'That plane is not at this airport!' unless contain? plane
    planes.delete(plane)
    self
  end

  def contain? plane
    planes.include? plane
  end

end
