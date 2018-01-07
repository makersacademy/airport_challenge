require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :weather

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Planes cant land as the weather is too stormy' if @weather.stormy?
    @planes << plane
  end

  def take_off
    raise 'the weather is too stormy' if @weather.stormy?
    @planes.pop
  end

end
