require_relative "plane"
require_relative "weather"

class Airport
  CAPACITY = 20

  def initialize
    @planes = []
  end
  
  def land(plane)
    raise "At capacity" if full

    @planes << plane
    return "roger wilko"
  end

  def take_off(plane)
    raise "No such plane" unless @planes.include?(plane)
    
    @planes.delete(plane)
    return "In the air"
  end

  private

  def full
    @planes.length >= CAPACITY
  end
end
