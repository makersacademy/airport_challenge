require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    raise 'Planes cant land as the weather is too stormy' if @weather.stormy?
    @planes << plane
  end

  def take_off
    raise 'Planes cant take off as the weather is too stormy' if @weather.stormy?
    @planes.pop
  end

end
