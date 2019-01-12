class Airport
  attr_reader :planes

  def initialize
    @planes = []
    @weather = rand(1..100) < 95 ? :sunny : :stormy
  end

  def weather_report
    return @weather
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
    return @planes.slice!(@planes.index(plane)) unless weather_report == :stormy

    raise("Can't take off during stormy weather")
  end
end

class Plane
end
