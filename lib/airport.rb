require_relative "plane"
require_relative "weather"

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
    raise "flying" if plane.state == "flying"
    raise "stormy" if @weather.stormy?
    raise "this plane is currently in another airport" unless @planes.include?(plane)

    plane.flying
    @planes.delete(plane)
  end

  def land(plane)
    raise "Airport is full" if @planes.count >= DEFAULT_CAPACITY
    raise "stormy" if @weather.stormy?
    @planes << plane
  end
end
