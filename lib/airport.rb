require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @capacity = 20
  end

  def land(plane)
    raise 'Airport is full' if @planes.count >= @capacity 
    @planes << plane
  end

  def launch(weather)
    raise 'Weather warning' if weather.stormy?
    @planes.pop
  end

end
