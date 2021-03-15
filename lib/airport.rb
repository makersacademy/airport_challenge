require 'plane'

class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
  end

  def take_off
    @planes.pop
  end

  def land(plane)
    fail 'Airport full' if @planes.count >= DEFAULT_CAPACITY

    @planes << plane
  end

  def weather_report
    weather = [true, false].sample
    weather == true ? 'Stormy' : 'Clear'
  end

  def safety_check
    fail 'Weather is stormy' if weather_report == 'Stormy'

    take_off
  end
end
