require 'plane.rb'

class Airport
attr_reader :hanger
attr_reader :weather
DEFAULT_CAPACITY = 20
  def initialize
    @hanger = []
    @weather = weather
  end

  def full?
    @hanger.count >= DEFAULT_CAPACITY
  end

  def stormy?
    @weather = rand(0..10)
    if weather == 9 || weather == 10
      true
    else
      false
    end
  end

  def land(plane)
    fail 'Hanger is full!' if full?
    fail 'Weather is stormy' if stormy?
    @hanger.push(plane)
  end

  def take_off(plane)
    fail 'Weather is stormy' if stormy?
    @hanger.delete(plane)
  end

  def hanger_report
    "Planes in the hanger: #{@hanger.length}"
  end
end
