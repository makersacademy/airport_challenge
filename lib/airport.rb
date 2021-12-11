class Airport 
 attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport at full capacity" if @planes.count >= 5
    @planes << plane
  end

  def depart
    @planes.pop
  end
end