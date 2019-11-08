require './lib/plane.rb'

class Airport
MAX_CAPACITY = 5

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    raise "Cannot land plane: Airport full" if @planes.count >= MAX_CAPACITY
    @planes << plane
  end

  def take_off_plane(plane)
    @planes.delete(plane)
  end
end
