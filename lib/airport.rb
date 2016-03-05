require_relative "plane"
require_relative "weather"

class Airport

  attr_reader :planes

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    planes << plane
    planes.last
  end

  def take_off(plane)
    if @weather.stormy?
      raise "Take-off prevented due to stormy weather"
    else
      planes.delete plane
    end
  end

end
