class Airport
  attr_accessor :planes
  
  def initialize
    @planes = []
  end
  
  def landed(plane)
    planes << plane
    "Plane has touched down!!"
  end
  
  def leave_gate
    planes.pop
    "Plane has taken off!!"
  end
end