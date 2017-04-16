require './lib/climate'
require './lib/plane'

class Airport

  attr_reader :planes, :climate
  attr_accessor :capacity
  DEFAULT_CAPACITY = 5

  def initialize(climate = Climate.new)
    raise 'Error: Parameter is not a climate.' unless climate.is_a?(Climate)
    @planes = []
    @climate = climate
    @capacity = DEFAULT_CAPACITY
  end

  def build_plane(plane = Plane.new)
    raise 'Error: The airport can only build planes.' unless plane.is_a?(Plane)
    planes << plane
  end

  def conditions
    climate.conditions
  end

  def dock_plane(plane)
    raise 'Error: Landing not possible when airport is full.' if planes.count >= capacity
    raise 'Error: Landing forbidden when weather is stormy.' if conditions == :stormy
    plane.land
    planes << plane
  end

  def release_plane(plane)
    raise 'Error: Take-off forbidden when weather is stormy.' if conditions == :stormy
    plane.take_off
    planes.delete(plane)
  end

end
