require_relative "plane"
require_relative "weather"


class Airport

attr_accessor :planes

def initialize(capacity=100)
  @capacity = capacity
  @planes = []
end

  def land(plane)
    planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def full?
  end


end
