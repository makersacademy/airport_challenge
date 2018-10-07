class Airport

  attr_accessor :hanger
  attr_reader :capacity

  def initialize(capacity = 50)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    raise "You cannot land. It is too stormy" unless weather != "stormy"
    raise "Capacity is full." unless reached_capacity != "full"
    @hanger << plane
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

def reached_capacity

  if @hanger.length > @capacity then return "full"
  end
end

class Plane

end
