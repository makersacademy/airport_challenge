class Airport

  attr_reader :planes

  def initialize(capacity = 1)
    @planes = []
  end

  def land(plane)
    fail "stormy can't land" if stormy? == true
    fail "airport full" unless @planes.length < 1
    @planes.push(plane)
  end

  def take_off
    fail "stormy can't take off" if stormy? == true
    @planes.pop
    @planes
  end

  def stormy?
    chance = rand(1..10)
    chance > 9 ? true : false
  end
end

class Plane

end
