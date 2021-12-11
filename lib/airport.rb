class Airport 
 attr_accessor :planes

  def initialize( capacity=5)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport at full capacity" if @planes.count >= @capacity
    @planes << plane
  end

  def depart
    @planes.pop
  end
end