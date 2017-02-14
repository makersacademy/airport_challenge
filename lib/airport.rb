require './lib/plane'
require './lib/weather'

class Airport
DEFAULT_CAPACITY = 1
attr_reader  :capacity, :landed_planes
  def initialize( capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @landed_planes = []
    @capacity = capacity
    @weather = weather
  end

  def landed?(plane)
    @landed_planes.include?(plane)
  end


  def authorize_landing(plane)
    raise "The plane has already landed" if landed?(plane)
    return "The airport is full, can not land" if full?
    return "Can not land in stormy weather" if stormy?
    plane.land
    @landed_planes << plane
  end

  def authorize_take_off(plane)
    raise "The plane hasn't landed here." if !landed?(plane)
    return "Can not take off in stormy weather" if stormy?
    plane.take_off
    @landed_planes.delete(plane)
  end

  private

  def stormy?
    @weather.conditions == :stormy
  end

  def full?
    @landed_planes.length == @capacity
  end



end
