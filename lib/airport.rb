require_relative 'plane'

class Airport

attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    fail "airport full" if @planes.count > 1
    @planes << plane
  end

  def takeoff
    fail "Airport is empty" if @planes.empty?
    @planes.pop
  end


end
