class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    raise "This is not a plane" unless plane.instance_of?(Plane)
    
    @landed_planes << plane
  end
end
