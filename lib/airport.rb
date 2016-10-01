require 'plane'
require 'weather'

class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail 'Weather too stormy for landing' if @weather.stormy
    @planes << plane
  end

  def take_off(plane)
    fail 'Weather too stormy for take off' if @weather.stormy
    @planes.delete(plane)
  end

  def planes
    @planes
  end

end
