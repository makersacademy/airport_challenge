require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    raise "Cannot land plane: Airport full" if @planes.count >= @capacity

    @planes << plane
  end

  def take_off_plane(plane)
    @planes.delete(plane)
  end
end
