require_relative 'plane'

class CONTROL_TOWER
  attr_accessor :capacity

  DEFAULT_CAPACITY = 50

  def initialize
    @plane = []
    @capacity=DEFAULT_CAPACITY
  end

  def weather
     "fine"
  end

  def land(plane)
    return 'NO' if self.weather == "stormy"
    return 'AT CAPACITY' if full?
    @plane << plane
  end

  def take_off(plane)
    return 'NO' if self.weather == "stormy"
    @plane.pop if @plane.count > 0
    @plane
  end

  def full?
    return true if @plane.count==DEFAULT_CAPACITY
  end
end
