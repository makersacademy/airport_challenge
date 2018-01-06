require_relative "plane"

class Airport 
  
  attr_reader :hanger

  def land(plane)
    @hanger = plane
  end
  
end
