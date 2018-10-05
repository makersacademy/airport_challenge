require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :weather
  attr_reader :plane

  def initialize
    @weather = Weather.new
  end

  def land(plane)
    @plane = plane
  end

  def take_off(plane)
    if @weather.clear == false
      fail 'Plane cannot take-off in a storm.'
    else
      @plane = nil
    end
  end

end