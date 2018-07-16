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
    @planes.count == 0
  end

  def land(plane)
    #fail 'There is a storm, cannot land plane' if weather.storm? == true
    fail 'Airport at full capacity' if full?
    @planes << plane
  end

  def launch_plane
    fail 'Airport is empty' if empty?
    #fail 'There is a storm, cannot launch plane' if weather.storm? == true
    @planes.pop
  end
end
