require './lib/plane'
require './lib/weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
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
