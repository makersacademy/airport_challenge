require "./lib/plane.rb"
require "./lib/weather.rb"

class Airport
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    #@planes = []
    @weather = Weather.new
  end

  def take_off(plane)
    if plane.landed? && !weather.stormy?
      plane.flying?
    #  @planes.delete(plane)
    else
      raise "Taking-off not permitted"
    end
  end

  def land(plane)
    if  plane.flying? && !weather.stormy? #&& @planes.length <= @capacity
      plane.landed?
    #  @planes << plane
    else
      raise "Landing not permitted"
    end
  end


end
