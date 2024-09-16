class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def assess_landing(plane, weather)
    raise "There is no space at this airport" if @planes.count >= @capacity
    raise "Unsafe weather conditions" unless weather.safe
    raise "Plane already parked" if plane.parked
  end

  def assess_take_off(plane, weather)
    raise "Unsafe weather conditions" unless weather.safe
    raise "Plane not parked here" unless @planes.include?(plane)
  end

  def take_off(plane, weather)
    assess_take_off(plane, weather)

    plane.parked = false
    @planes.delete(plane)
  end

  def land(plane, weather)
    assess_landing(plane, weather)

    plane.parked = true
    @planes << plane
  end

end
