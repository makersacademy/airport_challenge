require 'weather.rb'

class Airport

  attr_reader :planes

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Unable to land, stormy weather." if @weather.stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "Unable to take off, stormy weather." if @weather.stormy?
    @planes.delete(plane)
  end

end
