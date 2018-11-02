class Airport
  def initialize(weather = Weather.new)
    @weather = weather
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
  end

  def takeoff(plane)
    fail 'it is too stormy to take off' if @weather.stormy?
    @planes.delete(plane)
    "#{plane} has taken off"
  end
end

class Weather
  def stormy?
    weather = rand(10)
    weather < 8 ? false : true
  end
end
