class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    "Plane has landed"
  end

  def take_off(plane)
    "Plane has taken off"
  end

end
