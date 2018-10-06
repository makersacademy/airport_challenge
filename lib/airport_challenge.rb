class Airport
  attr_accessor :hanger
  attr_reader :capacity

  def initialize(capacity = 20)
    @capacity = capacity
    @hanger = []
  end

  def land(plane)
    raise "Cannot land, weather is stormy." unless weather != "stormy"
    raise "Cannot land, airport is full." unless @hanger.size < @capacity
    raise "Cannot land, plane is already in airport." if check_hanger(plane)
    @hanger << plane
  end

  def take_off(plane)
    raise "Cannot take off, plane is not in airport." unless check_hanger(plane)
    raise "Cannot take off, weather is stormy." unless weather != "stormy"
    @hanger.delete(plane)
  end

  def check_hanger(plane)
    @hanger.include?(plane)
  end

  def weather
    srand(1)
    rand(100) < 80 ? "sunny" : "stormy"
  end
end

class Plane
end
