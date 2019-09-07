require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane, weather)
    if weather.current_conditions == "stormy"
      raise "Weather is stormy: permission to land denied"
    else
      @planes << plane
    end
  end

  def takeoff(plane, weather)
    if weather.current_conditions == "stormy"
      raise "Weather is stormy: permission to takeoff denied"
    else
      @planes[0]
    end
  end
end
