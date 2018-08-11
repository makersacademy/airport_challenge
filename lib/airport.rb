require_relative 'plane'

class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise 'weather is stormy' if forecast == 'stormy'
    raise 'airport is full' if full?
    @planes << plane
  end

  def takeoff
    raise 'weather is stormy' if forecast == 'stormy'
    @planes.pop
  end

  def forecast
    rand(1) == 0 ? 'stormy' : 'fine'
  end

  def full?
    @planes.length >= @capacity
  end


end
