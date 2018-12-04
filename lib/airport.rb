require_relative 'weather'
require_relative 'plane'

class Airport

  attr_reader :plane, :weather

  def initialize(plane: Plane.new, weather: Weather.new)
    @plane = plane
    @weather = weather
  end

  def land(plane)
    raise 'bad weather stopped landing' if @weather.stormy?
    @plane = plane
  end

  def release_plane
    raise 'bad weather stopped departure' if @weather.stormy? true
    print "#{@plane} departed"
  end

end
