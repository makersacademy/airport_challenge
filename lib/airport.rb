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
    raise 'Plane is not airborne' unless plane.airborne
    raise 'Airport full' if full?
    raise 'Weather is stormy' if weather == 'stormy'

    plane.airborne = false
    planes << plane
  end

  def takeoff(plane)
    raise 'Plane is not in airport' unless landed?(plane)
    raise 'Plane is already airborne' if plane.airborne
    raise 'Weather is stormy' if weather == 'stormy'

    plane.airborne = true
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
