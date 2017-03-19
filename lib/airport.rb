require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr_reader :weather

  def initialize#weather: Weather.new
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    raise "Cannot land due to bad weather" if stormy?
    add_plane(plane)
    plane.landed?
  end

  def add_plane(plane)
    planes << plane
  end

  def take_off(plane)
    raise "Cannot take off due to bad weather" if stormy?
    planes.delete(plane)
  end

  private

  def stormy?
    @weather.stormy?
  end

end
