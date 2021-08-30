require_relative 'plane'

class Airport
  attr_reader :plane

  def lands(plane)
    @plane = plane
  end
  
  def takesoff
    @plane
  end
end