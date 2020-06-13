require_relative "plane"

class Airport
  # attr_reader :plane
  
  def initialize
  end
  
  def take_off
    fail "No waiting planes" unless @plane
    
    @plane
  end
  
  def land(plane)
    @plane = plane
  end
  
  def hangar_report
    @plane
  end
  
end
