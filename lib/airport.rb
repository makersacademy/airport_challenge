require_relative "plane"

class Airport
  # attr_reader :plane
  
  def initialize
  end
  
  def take_off
    Plane.new
  end
  
  def land(plane)
    @plane = plane
  end
  
  def hangar_report
    @plane
  end
  
end
