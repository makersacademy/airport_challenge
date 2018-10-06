class Airport

  attr_accessor :hanger

  def initialize
    @hanger = []
  end

  def land(plane)
    @hanger << plane
    raise "You cannot land. It is too stormy" unless weather != "stormy"
  end

  def total_planes(plane)
    @hanger.include?(plane)
  end

  def take_off(plane)
    raise "You cannot takeoff. It is too stormy" unless weather != "stormy"
    @hanger.delete(plane)
  end

  def weather
     x = rand(2)
    if x > 1 then return "stormy"
    end
  end
end

class Plane

end
