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
   ["stormy","sunny"].sample
  end
end

def reached_capacity
  "full" if @hanger.length > @capacity

end

class Plane

end
