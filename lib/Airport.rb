require_relative "plane"
require_relative "weather"
class Airport
  attr_reader :hangar 

  def initialize(weather_class = Weather)
    @hangar = []
    @weather = weather_class.new
  end
    
  def land(plane) 
    @hangar << plane
    "#{plane} has landed"
  end
    
  def take_off(plane)  
    # fail "Unable to take off due to storm" if stormy?
    return "This plane is not in the hangar" unless @hangar.include?(plane)
    plane_index = @hangar.index(plane)
    @hangar.delete_at(plane_index)
    "#{plane} has taken off"
  end

  def stormy?
    @weather.generate == "Stormy"
end
end
