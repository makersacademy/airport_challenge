
class Airport
  attr_reader :terminal

  def initialize
    @terminal = []
  end

  def land(plane)
    raise "No landing when stormy" unless good_weather?
    @terminal << plane
  end

  def take_off(plane)
    raise "No takeoff when stormy" unless good_weather?
    plane.took_off
    @terminal.pop
  end

  def good_weather?
    rand(100) >= 20 ? true : false
  end
end
