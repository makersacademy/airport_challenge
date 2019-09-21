require_relative 'plane'

class Airport

  attr_reader :plane
  ::DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    @planes << plane
  end

  def takeoff
  end

end
