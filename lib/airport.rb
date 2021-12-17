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
    raise 'Cannot land when weather is stormy' if weather == 'stormy'
    planes << plane
  end

  def takeoff(plane)
    raise 'Plane not in airport' unless landed?(plane)
    raise 'Cannot takeoff when weather is stormy' if weather == 'stormy'
    planes.delete(plane)
  end

  def landed?(plane)
    planes.include?(plane)
  end

  def weather
    rand(10) < 9 ? 'sunny' : 'stormy'
  end

  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end
end
