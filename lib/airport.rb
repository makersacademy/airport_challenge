require './lib/plane'
require './lib/weather'

class Airport

  DEFAULT_CAPACITY = 30

  attr_reader :planes
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise 'No free runways' if @planes.count >= DEFAULT_CAPACITY
    raise 'Plane cannot land due to dangerous weather' if @conditions == :stormy
    @planes << plane
    return "The plane has landed."
  end

  def takeoff
    raise 'Plane cannot take off due to dangerous weather' if @conditions == :stormy
    @planes.pop
    return "The plane has taken off"
  end

end
