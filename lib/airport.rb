class Airport
  attr_reader :planes, :capacity

  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    check_weather(weather)
    raise 'Airport full.' if airport_full?
    plane.land
    @planes.push(plane)
  end

  def take_off(plane, weather)
    check_weather(weather)
    raise 'Plane not in airport.' if no_plane?(plane)
    plane.take_off
    @planes.delete(plane)
  end

  private

  def too_stormy?(weather)
    weather.stormy?
  end

  def airport_full?
    @planes.size >= CAPACITY
  end

  def no_plane?(plane)
    !@planes.include? plane
  end

  def check_weather(weather)
    raise "It's too stormy!" if too_stormy?(weather)
  end
end
