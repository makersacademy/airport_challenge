require_relative "plane"

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Airport full" if full?
    @planes << plane
  end

  def takeoff(plane)
    @planes.select! {|other_planes| other_planes != plane}
  end

  def full?
    @planes.length == capacity
  end
end
