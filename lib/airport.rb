require_relative 'plane'

class Airport
  CAPACITY = 20

  attr_reader :recent_departure

  def initialize
    @planes = []
  end
  
  def land(plane)
    fail "The plane cannot land as airport is at capacity" if @planes.count >= CAPACITY
    @planes << plane
  end

  def take_off
    @recent_departure = @planes.pop
  end

  def gone?
    !@planes.include?(@recent_departure)
  end
end
