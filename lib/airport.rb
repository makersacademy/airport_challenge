require './lib/plane'
require './lib/weather'

class Airport
DEFAULT_CAPACITY = 1
attr_reader  :capacity, :landed_planes
  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @weather = weather
    @capacity = capacity
  end

  def landed?(plane)
    @landed_planes.include?(plane)
  end


  def authorize_landing(plane)

    return "Can not land in stormy weather" if stormy?
    return "The airport is full, can not land" if full?
    raise "The plane has already landed" if landed?(plane)
    plane.land
    @landed_planes << plane
  end

  def authorize_take_off(plane)
    return "Can not take off in stormy weather" if stormy?
    raise "The plane hasn't landed here." if !landed?(plane)
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
