require_relative 'plane'
class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 50
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "The airport is full" if full?
    fail "It is too stormy to land" if weather == "stormy"

    @plane = plane
    @planes << @plane
  end

  def take_off
    fail "It is too stormy to take off" if weather == "stormy"

    @planes.pop
  end

  def weather
    "stormy"
  end

  private
  def full?
    @planes.count >= DEFAULT_CAPACITY
  end
end
