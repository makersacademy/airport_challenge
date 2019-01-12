class Airport
  attr_reader :planes

  def initialize
    @planes = []
    @weather = rand(1..100) < 95 ? :sunny : :stormy
  end

  def weather_report
    return @weather
  end

  def clear_skies?
    return weather_report==:stormy ? false : true
  end

  def land(plane)
    raise("Can't land during stormy weather") if !clear_skies?

    @planes << plane
  end

  def takeoff(plane)
    return @planes.slice!(@planes.index(plane)) unless !clear_skies?

    raise("Can't take off during stormy weather")
  end
end

class Plane
end
