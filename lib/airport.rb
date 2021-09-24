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

  def attempt_takeoff(plane)
    raise "Airport empty!" if airport_empty?
    is_landed?(plane) ? takeoff(plane) : raise("Your plane isn't in the airport!")
  end

  private

  def airport_full?
    @landed_planes.length >= @capacity
  end

  def airport_empty?
    @landed_planes.length == 0
  end

  def is_landed?(plane)
    if @landed_planes.include?(plane) or !plane.flying
      true
    else
      false
    end
  end

  def land(plane)
    @landed_planes << plane 
    plane.flying = false
  end

  def takeoff(plane)
    @landed_planes.delete(plane)
    plane.flying = true
  end

end
