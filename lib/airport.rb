class Airport
  attr_accessor :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    raise "This is not a plane" unless plane.instance_of?(Plane)

    raise "This plane has already landed" if @landed_planes.include?(plane)

    @landed_planes << plane
  end

  def take_off(plane)
    raise "This is not a plane" unless plane.instance_of?(Plane)

    raise "This plane is not at the airport" unless @landed_planes.include?(plane)

    @landed_planes.delete(plane)
  end
end
