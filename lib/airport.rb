require 'plane'

class Airport
  
  def initialize
    @plane = []
  end

  def land(plane)
    raise 'The airport is full' if @plane.length  == 1 
    @plane.push(plane)
  end

  def take_off(plane)
    @plane.delete(plane)
    "#{plane} has taken off"
  end

  
end