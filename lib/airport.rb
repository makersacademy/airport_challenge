require_relative 'plane'
require_relative 'weather'
require_relative 'controller'

class Airport
  CAPACITY = 15

  def initialize(capacity = CAPACITY)
  @capacity = capacity
  @planes = []
  end

  def land(plane)

  end

  def boarding
    raise 'Weather is stormy, cannot land' if stormy?
  end


  def stormy_weather
    Weather.new.stormy?
  end

end
