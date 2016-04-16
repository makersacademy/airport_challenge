require_relative 'plane'

class Airport

  attr_reader :plane

  def instruct_takeoff
    Plane.new
  end

  def instruct_landing(plane)
    raise "Gate full" if @plane
     @plane = plane
  end
end