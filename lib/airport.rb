require_relative 'plane'

class Airport
  attr_reader :planes, :capacity
  DEF_CAPACITY = 100

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    @planes << plane
    @planes[0]
  end

  def take_off(plane)
    @planes.pop
  end

end
