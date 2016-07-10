require_relative 'weather'

class Airport
  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def accept(plane)
    fail 'This plane has already landed here' if @planes.include? plane
    fail 'Could not land because of stormy weather' if @weather.stormy?
    @planes << plane
    plane.land
  end

  def take_off(plane)
    fail 'This plane was not found in the airport' unless @planes.include? plane
    fail 'Could not take off because of stormy weather' if @weather.stormy?
    @planes.delete(plane).take_off
  end

end
