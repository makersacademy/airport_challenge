require_relative '../lib/weather'
require_relative '../lib/plane'

class Airport
  attr_reader :capacity, :ramp

  def initialize
    # default capacity of 1
    @capacity = 1
    # where planes are parked
    @ramp = []
    # weather
    @weather = Weather.new
  end

  def land(plane)
    raise 'sorry, plane cannot land' unless good_weather? && capacity?
    
    @ramp << plane
    self
  end

  def takeoff(plane)
    raise 'sorry, plane cannot take off due to bad weather' unless good_weather?
    
    @ramp.delete(plane)
    self
  end

  def good_weather?
    @weather.sunny?
  end

  def capacity?
    # checks parked planes vs. capacity
    @capacity > @ramp.count
  end
end
