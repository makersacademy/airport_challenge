class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    raise ArgumentError.new('Capacity must be positive') if capacity.negative?

    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Plane is already landed in airport' if landed?(plane)
    raise 'Airport full' if full?
    planes << plane
  end

  def takeoff(plane)
    raise 'Plane not in airport' unless landed?(plane)
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
