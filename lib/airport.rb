class Airport
  attr_reader :planes, :capacity

  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    raise "It's too stormy!" if too_stormy?(weather)
    raise 'Airport full.' if airport_full?
    @planes.push(plane)
  end

  def take_off(plane, weather)
    raise "It's too stormy!" if too_stormy?(weather)
    raise 'Plane not in airport.' if no_plane?(plane)
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
    @planes.includes? plane
  end
end
