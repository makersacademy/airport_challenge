class Airport
  attr_reader :capacity
  attr_reader :landed_planes

  def initialize(capacity = 10)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    if airport_full?
      raise "Airport full!"
    elsif !plane.flying
      raise "Plane is already landed"
    else
      @landed_planes << plane 
      plane.flying = false
    end
  end

  private

  def airport_full?
    @landed_planes.length >= @capacity
  end

end
