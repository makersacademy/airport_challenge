class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
  end

  def take_off
    fail "stormy can't take off" if stormy? == true
    @planes.pop
    @planes
  end

  def stormy?
    false
  end
end

class Plane

end
