require_relative "plane"
require_relative "weather"

class Airport
  def initialize
    @planes = []
  end
  def land(plane)
    @planes << plane
    return "roger wilko"
  end

  def take_off(plane)
    if @planes.include?(plane)
      return "In the air"
      @planes.delete(plane)
    else
      raise "No such plane" 
    end
  end
end
