require_relative "plane"
require_relative "weather"
class Airport
  attr_reader :hangar 

  def initialize(weather_class = Weather, max_capacity = 5)
    @hangar = []
    @weather = weather_class.new
    @max_capacity = max_capacity
  end
    
  def land(plane)
    fail "Cannot land, airport is at maximum capacity" if max_capacity?
    fail "Cannot land due to storm" if stormy? 
    @hangar << plane
    "#{plane} has landed"
  end
    
  def take_off(plane)
    fail "This plane is not in the hangar" unless @hangar.include?(plane)
    fail "Cannot takeoff due to storm" if stormy?
    plane_index = @hangar.index(plane)
    @hangar.delete_at(plane_index)
    "#{plane} has taken off"
  end

  def stormy?
    @weather.generate == "Stormy"
  end

  def max_capacity?
    @hangar.length == @max_capacity
  end
end
