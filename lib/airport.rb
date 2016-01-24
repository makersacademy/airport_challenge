require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Piss off, it's too stormy" if @weather.stormy?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise "Piss off, it's too stormy" if @weather.stormy?
    plane.take_off
    @planes.delete(plane)
  end

end
