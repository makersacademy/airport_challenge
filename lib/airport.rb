require_relative "plane"

class Airport
  attr_accessor :plane

  def initialize 
    @plane = plane
  end

  def can_land
    true
  end

  def land(plane)
    plane
  end

end
