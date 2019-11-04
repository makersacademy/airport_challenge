require './lib/plane.rb'

class Airport
  def land(plane)
    if @plane == nil
      @plane = plane
    else
      raise RuntimeError, "Airport full"
    end
  end

  def takeoff
    Plane.new
  end
end
