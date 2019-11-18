class Airport
  attr_reader :planes_held

  DEFAULT_CAPACITY = 100

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_held = []
    @weather = weather
  end

  def land(plane)
    raise "Plane has already landed" if contains?(plane) || plane.grounded?
    raise "Airport capacity has been reached" if full?
    raise "Adverse weather conditions" if stormy?

    plane.land(self)
    planes_held << plane
  end

  def takeoff(plane)
    raise "Plane is not at airport" unless contains?(plane)
    raise "Adverse weather conditions" if stormy?

    plane.takeoff(self)
    planes_held.delete(plane)
  end

  private

  attr_reader :weather, :capacity

  def full?
    planes_held.length >= capacity
  end

  def contains?(plane)
    planes_held.include? plane
  end

  def stormy?
    weather.stormy?
  end

end
