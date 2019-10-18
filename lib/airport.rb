class Airport
 
  def initialize
    @plane = []
    @capacity = 1
  end

  def land(plane)
    @plane << plane
  end


end