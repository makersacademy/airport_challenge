require_relative 'plane'
require_relative 'weather'

class Airport
attr_reader :avail_planes, :capacity, :weather
DEFAULT_CAPACITY = 18

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @avail_planes = []
    @weather = weather
  end

  def plane_landing(plane)
    raise "airport full, please redirect" if full?
    raise "weather stormy, please redirect" if weather.is_stormy?
    @avail_planes << plane
  end

  def plane_takeoff
    @avail_planes.pop
  end

private
  def full?
    @avail_planes.length >= DEFAULT_CAPACITY
  end

end
