class Airport

  attr_reader :planes, :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "stormy can't land" if stormy? == true
    fail "airport full" unless @planes.length < @capacity
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
