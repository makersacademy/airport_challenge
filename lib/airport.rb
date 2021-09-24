class Airport
  attr_reader :capacity
  attr_reader :landed_planes

  def initialize(capacity = 10)
    @landed_planes = []
    @capacity = capacity
  end

  def attempt_landing(plane)
    raise "Airport full!" if airport_full?
    plane.flying ? land(plane) : raise("Plane is already landed")
  end

  private

  def airport_full?
    @landed_planes.length >= @capacity
  end

  def land(plane)
    @landed_planes << plane 
    plane.flying = false
  end

end
