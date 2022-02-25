class Airport
  def initialize(name, capacity = 10)
    @name = name
    @capacity = capacity
    @planes = []
    @current_weather = "Unknown"
  end

  def land(plane)
    raise "Airport is full" if full?
    raise "Cannot land during stormy weather" if stormy?

    @planes << plane
  end

  def take_off(departing_plane)
    raise "Cannot take off during stormy weather" if stormy?

    @planes.delete(departing_plane)
  end

  def weather_update(weather)
    @current_weather = weather
  end

  def report_capacity
    return @capacity
  end

  def full?
    return @planes.size >= @capacity
  end

  def stormy?
    return @current_weather == "Stormy"
  end

  def list_planes
    return @planes
  end
end
