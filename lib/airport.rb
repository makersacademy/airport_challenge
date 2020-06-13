require_relative 'plane.rb'

class Airport
  CAPACITY = 20
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport capacity full.' if full?
    @planes << plane
  end

  def full?
    @planes.length >= CAPACITY
  end

  def take_off(plane)
  end

end
