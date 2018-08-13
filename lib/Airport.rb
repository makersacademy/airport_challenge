require_relative "plane"
require_relative "weather"
class Airport
  attr_reader :hangar 

  def initialize(weather_class = Weather)
    @hangar = []
    @weather = weather_class.new
  end
    
  def land(plane)
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
end
