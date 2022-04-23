require_relative 'plane'

class Airport
  
  attr_reader :plane

  def initialize 
    @plane = false
  end

  def land(plane)
    fail 'Airport full' if @plane
    @plane = plane
  end

  def take_off(plane)
    plane
  end
          
end