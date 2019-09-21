require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :stormy, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @planes = []
    @stormy = weather.stormy?
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Weather is too stormy to land" if (stormy == true)
    @planes << plane
  end

  def takeoff
    raise "Weather is too stormy to takeoff" if (stormy == true)
    @planes.pop
  end

  private
  
  def capacity
    @capacity
  end

end
