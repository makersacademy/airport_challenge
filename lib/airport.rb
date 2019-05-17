class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def plane_takeoff
    raise "There are no planes in the airport" if @planes.empty?
    @planes.pop
  end

end