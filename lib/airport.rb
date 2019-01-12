class Airport
  attr_reader :planes
  attr_reader :max_capacity

  def initialize
    @planes = []
    @weather = rand(1..100) < 95 ? :sunny : :stormy
    @max_capacity = 5
  end

  def weather_report
    return @weather
  end

  def clear_skies?
    return weather_report != :stormy
  end

  def land(plane)
    raise("Can't land during stormy weather") unless clear_skies?

    @planes << plane
  end

  def takeoff(plane)
    raise("Plane not found!") unless @planes.include?(plane)

    return @planes.slice!(@planes.index(plane)) if clear_skies?

    raise("Can't take off during stormy weather")
  end
end

class Plane
end
