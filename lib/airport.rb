require_relative 'plane'

class Airport
  attr_reader :planes

  def stormy?
    weather = ["Sunny", "Stormy"].sample
    weather == "Stormy"
  end

  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  def takeoff(weather, planers)
    fail 'Weather is stormy!' if weather.stormy?
    planes.pop
  end

  def confirm(plane)
    planes.count
  end
end
