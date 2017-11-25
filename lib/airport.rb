require_relative "plane"

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Plane already in aiport" if @planes.include?(plane)
    fail "Airport full" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "Plane not in airport" if !@planes.include?(plane)
    @planes = @planes - [plane]
  end

private

  def full?
     @planes.length == @capacity
  end

end
