require_relative 'plane.rb'

class Airport
  DEFUALT_CAPACITY = 20
  attr_reader :planes, :capacity

  def initialize(capacity = DEFUALT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off
    @planes.pop
    "The plane has taken off"
  end

  def land(plane)
    fail "Plane unable to land, airport full" if full?
    @planes << plane
    "The plane landed safely"
  end

  private

  def full?
    @planes.count == @capacity
  end
end
