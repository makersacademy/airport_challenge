require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :airport
  attr_reader :weather_forcaster

  def initialize
    @airport = []
    @weather_forcaster = Weather.new
  end

  def land(plane)
    if @weather_forcaster.stormy?
      @airport
    else
      @airport << plane
    end
  end

  def takeoff(plane)
    if @weather_forcaster.stormy?
      @airport
    else
      @airport.pop
      @airport
    end
  end

end
