require_relative 'plane'

class Airport

  attr_reader :plane

  def initialize
    @plane = plane
  end

  def controller(plane)
    plane.land?
  end


end
