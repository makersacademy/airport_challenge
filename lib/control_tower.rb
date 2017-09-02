require_relative 'plane'
require_relative 'weather_report'

class CONTROL_TOWER
  attr_accessor :capacity
  attr_reader :weather
  attr_reader :plane

  DEFAULT_CAPACITY = 50

  def initialize
    @plane = []
    @capacity = DEFAULT_CAPACITY
  end

  def weather_report
    number = [1, 2].sample
    @weather = 'stormy' if number == 1
    @weather = 'clear' if number == 2
    @weather
  end

  def land(plane)
    return 'NO' if @weather == 'stormy'
    return 'AT CAPACITY' if full?
    @plane << plane
  end

  def take_off(plane)
    return 'NO' if @weather == 'stormy'
    @plane.pop if @plane.count > 0
    @plane
  end

  def full?
    return true if @plane.count==DEFAULT_CAPACITY
  end
end
