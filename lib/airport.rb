require_relative 'plane'

class Airport

  attr_reader :recent_departure

  def initialize
    @planes = []
  end
  
  def land(plane)
    @planes << plane
  end

  def take_off
    @recent_departure = @planes.pop
  end

  def gone?
    !@planes.include?(@recent_departure)
  end
end
