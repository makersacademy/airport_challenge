require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Sorry, just too stormy" if stormy?
    fail "Airport is full" if full?
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    fail "Sorry, just too stormy" if stormy?
    plane.lift_off
    @planes.delete(plane)
  end


  private

  def stormy?
    return true if rand(1..30) == 1
  end

  def full?
    @planes.count >= @capacity
  end

end
