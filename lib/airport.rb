require_relative 'plane'


class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @docked_planes = []
  end

  def land_plane(plane)
    raise 'weather is stormy' if forecast == 'stormy'
    fail 'airport is full' if full?
    @docked_planes << plane
    @docked_planes.last
  end

  def takeoff
    raise 'weather is stormy' if forecast == 'stormy'
    @docked_planes.pop
  end

  def forecast
    rand(15) == 3 ? 'stormy' : 'fine'
  end

  def full?
    @docked_planes.length >= @capacity
  end

end
