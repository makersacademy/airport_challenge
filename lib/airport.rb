class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def plane_landing(plane)
    @planes.append(plane)
    self
  end

  def plane_taking_off(plane)
    @planes.delete(plane)
    self
  end

  def plane_entering_on_ground(plane)
    @planes.append(plane)
    self
  end
end
