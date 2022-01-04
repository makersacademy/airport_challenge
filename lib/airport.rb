class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    raise ArgumentError.new('Capacity must be positive') if capacity.negative?

    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise 'Plane is already landed in airport' if landed?(plane)
    raise 'Airport full' if full?
    raise 'Weather is stormy' if weather.stormy?

    plane.land
    planes << plane
  end

  def takeoff(plane)
    raise 'Plane is not in airport' unless landed?(plane)
    raise 'Weather is stormy' if weather.stormy?

    plane.takeoff
    planes.delete(plane)
  end

  def landed?(plane)
    planes.include?(plane)
  end

  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end
end
