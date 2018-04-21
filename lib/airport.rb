require_relative './exceptions'
require_relative './weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
    @weather_forecaster = Weather.new
  end

  def receive_plane(plane)
    @planes << plane
  end

  def release_plane(plane)
    @planes.delete(plane)
  end

  def stormy?
    @weather_forecaster.stormy?
  end
end
