require_relative 'plane'

class Airport

  attr_reader :plane

  def let_takeoff
    Planes.new
  end

  def let_landing(plane)
    @plane = plane
  end
end
