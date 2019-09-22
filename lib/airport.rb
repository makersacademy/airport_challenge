require_relative 'plane'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'PlaneAlreadyLanded' if plane.landed == true
    
    plane.report_landed    
    @planes << plane
  end

  def take_off(plane)
    fail 'Error: You have already taken off' if plane.flying == true

    plane.report_flying
    @planes.delete(plane)
  end
end