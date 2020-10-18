require_relative 'plane'

class Airport
  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 30
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Abort! No room for landing" if full?
    planes << plane
    plane
  end

  def take_off
    planes.pop
  end

  def weather_conditions
    sunny = rand(100)
    @safe = sunny < 70
  end





  private

  def full?
   planes.count >= capacity
  end

end
