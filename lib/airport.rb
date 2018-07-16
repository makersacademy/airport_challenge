require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.count.zero?
  end

  def land(plane)
#    fail 'There is a storm, cannot land plane' if weather.stormy?
    fail 'Cannot land plane: Airport full' if full?
    @planes << plane
  end

  def launch(plane)
#    fail 'There is a storm, cannot launch plane' if weather.stormy?
    fail 'Airport is empty' if empty?
    @planes.pop
  end
end
