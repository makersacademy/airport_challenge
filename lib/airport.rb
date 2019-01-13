class Airport

  attr_reader :planes, :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "already landed" if plane.flying == false
    fail "stormy can't land" if stormy? == true
    fail "airport full" unless @planes.length < @capacity
    plane.grounded
    @planes.push(plane)
  end

  def take_off(plane)
    fail "already flying" if plane.flying == true
    fail "stormy can't take off" if stormy? == true
    plane.airborne
    @planes.delete(plane)
    @planes
  end

  def stormy?
    chance = rand(1..10)
    chance > 9 ? true : false
  end
end
