

class Airport
  attr_accessor :landed_planes, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "This is not a plane" unless plane.instance_of?(Plane)

    raise "This plane has already landed" if @landed_planes.include?(plane)

    raise "The airport is full" if @landed_planes.size == @capacity

    raise "No landings allowed while the weather is stormy" if Weather.stormy?

    @landed_planes << plane
  end

  def take_off(plane)
    raise "This is not a plane" unless plane.instance_of?(Plane)

    raise "This plane is not at the airport" unless @landed_planes.include?(plane)

    raise "No take offs allowed while the weather is stormy" if Weather.stormy?

    @landed_planes.delete(plane)
  end
end
