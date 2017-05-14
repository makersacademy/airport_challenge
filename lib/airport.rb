require 'plane'
require 'weather'

class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
    @weather = Weather.new
  end

  def land(plane = Plane.new)
    @landed_planes << plane
    'Plane has landed'
  end

  def plane_takeoff
    p "VISIBILITY AHASHDFJASD #{@weather.stormy?}"
    fail 'Cannot take off when its stormy' if bad_conditions?
    @landed_planes.pop
    'Plane has taken off'
  end

  def bad_conditions?
    @weather.stormy?
  end
  # def check_condition(weather = Weather.new)
  #   @weather = weather
  #   @weather.stormy?
  # end
end
