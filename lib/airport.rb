class Airport
  attr_reader :parked_planes, :capacity

  DEFAULT_CAPACITY = 30

  def initialize(capacity=DEFAULT_CAPACITY)
    @parked_planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    raise 'Too dangerous to land' if weather.stormy
    raise 'Airport full' if @parked_planes.count >= @capacity
    @parked_planes << plane
  end

  def leave(plane, weather)
    raise 'Too dangerous to take off' if weather.stormy
    @parked_planes.delete(plane)
  end

  def check_for_plane plane
    @parked_planes.include? plane
  end
end
