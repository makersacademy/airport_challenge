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

  def take_off(serial_number)
    raise "Cannot take off during stormy weather" if stormy?
    
    departing_plane = @planes.find { |plane| plane.serial_number == serial_number }
    departing_plane.change_location("Sky")
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
