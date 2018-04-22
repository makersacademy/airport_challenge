class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    check_weather(weather)
    raise 'Airport full.' if airport_full?
    plane.land
    @planes.push(plane)
  end

  def takeoff(plane, weather)
    check_weather(weather)
    raise 'Plane isn't docked' if no_plane?(plane)
    plane.take_off
    planes.delete(plane)
  end

  private

  def too_stormy?(weather)
end
