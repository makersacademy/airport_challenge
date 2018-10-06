class Airport

  attr_reader :capacity, :planes, :location

  DEFAULT_CAPACITY = 20

  def initialize(location, capacity = DEFAULT_CAPACITY)
    @location = location
    @capacity = capacity
    @planes = []
  end

  def add(plane)
    @planes << plane
  end

  def remove(plane)
    planes.delete(plane)
  end

  def take_off(plane)
    return nil if plane.location != location
    remove(plane)
    plane.fly
  end

  def land(plane)
    return nil if plane.location != "Sky"
    add(plane)
    plane.location = @location
  end

  def full?
    @planes.count >= @capacity
  end

end
