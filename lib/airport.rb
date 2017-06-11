
class Airport
  attr_reader :terminal

  def initialize
    @terminal = []
  end

  def land(plane)
    @terminal << plane
  end

  def take_off(plane)
    raise "No takeoff when stormy" if !good_weather?
    plane.took_off
    @terminal.pop
  end

  def good_weather?
     rand(100) >= 20 ? true : false
  end
end
