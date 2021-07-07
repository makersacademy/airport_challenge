# understading airport object
require_relative 'plane'
require_relative 'weather'
class Airport
  attr_accessor :capacity, :weather
  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def takeoff(plane)
    raise 'plane is flying' if plane.status == 'flying'
    raise 'air is stormy' if @weather.stormy?
    raise 'this plane is currently in another airport' unless @planes.include?(plane)

      plane.flying
      @planes.delete(plane)

  end

  def land(plane)
    raise 'plane is in apron' if plane.status == 'taxi'
    raise 'Airport is full now' if @planes.count >= DEFAULT_CAPACITY
    raise 'air is stormy' if @weather.stormy?

    plane.taxi
    @planes << plane
  end

end
