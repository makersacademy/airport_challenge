class Airport
   def initialize
     @runway = []
  end

  def land(plane)
    @runway << plane
  end

  def take_off
  end
end

class Plane
end
