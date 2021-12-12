require './lib/plane'

class Airport
  attr_reader :plane
  attr_reader :capacity
  attr_reader :hangar

  def initialize(capacity = 3)
    @capacity = capacity
    @hangar = []
  end

  def land_plane(plane)
    raise "Permission denied. Stormy weather" unless check_weather == "sunny"
    raise "Permission not granted. The airport is full." unless @hangar.length < @capacity
    @hangar << plane
  end

  def take_off(plane)
    raise "Permission denied. Stormy weather" unless check_weather == "sunny"
    plane
  end
  
  def check_weather
    return "sunny" unless rand(5) == 4
    "stormy"
  end
end
