require_relative 'weather'
require_relative 'plane'

class Airport

  attr_reader :plane, :weather, :capacity
  HANGER_CAPACITY = 20

  def initialize(plane: Plane.new, weather: Weather.new, capacity: HANGER_CAPACITY)
    @hanger = []
    @plane = plane
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise 'Bad weather stopped landing' if @weather.stormy?
    raise 'Hanger full' if @hanger.length >= @capacity
    @hanger << plane
    @hanger
  end

  def release_plane
    raise 'bad weather stopped departure' if @weather.stormy?
    print "#{@plane} departed"
    @hanger.delete(@plane)
  end

end
