require_relative 'plane'

class Airport

attr_accessor :capacity

  def initialize(capacity=1)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    plane
  end

end
