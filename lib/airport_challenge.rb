class Airport
  attr_accessor :hanger
  attr_reader :capacity

  def initialize(capacity = 20)
    @capacity = capacity
    @hanger = []
  end

  def land(*)
    raise "Cannot land, weather is stormy." unless weather == "sunny"
    raise "Cannot land, airport is full." unless @hanger.size < @capacity
    true
  end

  def take_off(*)
    raise "Cannot take off, weather is stormy." unless weather != "stormy"
    true
  end

  def check(*)
    false
  end

  def weather(weather = "sunny")
    weather
  end
end

class Plane
end
