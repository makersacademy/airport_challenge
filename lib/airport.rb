require "plane"
class AirPort

  attr_reader :airport_hanger

  def initialize
    @airport_hanger = []
  end
  
  def land(plane)
    airport_hanger << plane
  end
end
