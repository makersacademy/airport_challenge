require './lib/plane'

class Airport
  attr_reader :plane
  attr_reader :capacity

  def initialize(capacity = 1)
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Permission not granted. The airport is full." unless @plane.nil?
    @plane = plane
  end

  def take_off(plane)
    plane
  end
  
  def check_weather
    return "sunny" unless rand(5) == 4
    "stormy"
  end
end
