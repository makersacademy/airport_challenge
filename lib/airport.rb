require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land plane
    fail 'Unable to land due to stormy weather' if weather.stormy?
    plane.land
    planes << plane
  end

  def take_off plane
    fail 'Unable to take off due to stormy weather' if weather.stormy?
    plane.take_off
    planes.delete(plane)
  end

  private

  attr_reader :weather

end
