require_relative "plane"
class Airport 
 
  def initialize
    @hangar = []
  end
  def land(plane)
    @hangar << plane
    plane
  end
end