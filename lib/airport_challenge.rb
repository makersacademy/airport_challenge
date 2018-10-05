class Airport
  attr_accessor :weather
  attr_accessor :hanger

  def initialize
    @weather = ["sunny", "stormy"].sample
    @hanger = []
  end

  def land(plane)
    self.weather == "sunny"
    @hanger << plane
  end

  def take_off(*)
    self.weather == "sunny"
    @hanger.delete(plane)
  end

  def check
    return []
  end
end

class Plane
end
