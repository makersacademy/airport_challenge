require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather)
    @planes = []
    @capacity = capacity
    @weather = weather

  def land(plane)
    planes.push(plane)
  end

  def takeoff
    planes.pop
  end

end
end
