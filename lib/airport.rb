require 'plane'

class Airport
  attr_reader :planes

  def initialize(capcacity = 5)
    @planes = Array.new(capcacity)
  end
  def land(plane) 
    'Plane has landed safely!'
  end
  def takeOff(plane)
    'Plane has taken off safely!'
  end
end
