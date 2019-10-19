require "weather"

class Airport
  attr_reader :planes

  def initialize(name = "Heathrow")
    @weather = Weather.new
    @planes = []
    @name = name
  end

  def open_for_landing?
    @weather.weather_status == "Sunny"
  end

  def land(plane)
    raise "Stormy, can't land planes" unless open_for_landing?

    plane.land(self)
    @planes << plane
  end

end
