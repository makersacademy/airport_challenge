require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def land(plane)
    if @plane == nil
      @plane = plane
    else
      raise RuntimeError, "Airport full"
    end
  end

  def takeoff
    Plane.new
  end
end
