require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
  end

  def take_off_plane(plane)
  end

end
