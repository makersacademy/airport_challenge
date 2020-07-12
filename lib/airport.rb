require "./lib/plane.rb"

class TrafficControl
  def initialize
    @runway = []
  end
  
  def land(plane)
    @runway << plane
  end
  
  def takeoff(plane)
    @runway.delete(plane)
  end
  
  def show_runway
    @runway
  end
end
