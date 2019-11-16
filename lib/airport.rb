class Airport
  attr_reader :planes, :capacity

  def initialize
    @planes = [] 
    @capacity = 100
  end

  def harbour_plane(plane)
    raise Errors::AT_CAPACITY if @planes.length == @capacity
    @planes.push plane
  end

  def commission_flight(plane)
    plane
  end
end
