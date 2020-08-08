require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if @planes.count >= 10
    
    @planes << plane
  end

  def takeoff
    fail "No planes are at the airport" if @planes.empty?

    @planes[-1].set_as_flying
    @planes.pop
  end
end
