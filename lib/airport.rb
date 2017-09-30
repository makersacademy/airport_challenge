class Airport
  attr_reader :parked_planes

  def initialize
    @parked_planes = []
  end

  def land(plane, weather)
    raise 'Too dangerous to land' if weather.stormy
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
