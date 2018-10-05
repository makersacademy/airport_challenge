class Airport
  attr_accessor :weather
  attr_accessor :hanger

  def initialize(hanger = Plane.new)
    @hanger = [hanger]
  end

  def land(plane)
    @weather == "sunny" ? @hanger << plane : false
  end

  def take_off(plane)
    @weather == "sunny" ? @hanger.delete(plane) : false
  end

  def check
    return @hanger
  end

  def set_weather(weather)
    @weather = weather
  end
end

class Plane
end
