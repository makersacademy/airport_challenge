class Airport

  attr_reader :plane

  def initialize
    @plane = []
  end

  def land(plane)
    fail "Airport full" if @plane.count >= 100
    
    @plane << plane
  end

  def take_off
    return "Plane has left the airport" unless @plane.empty?
  end

end
