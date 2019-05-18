class Airport

  attr_reader :name, :code, :planes

  def initialize(weather, name, code)
    @weather = weather
    @name = name
    @code = code
    @planes = []
  end

  def receive(plane)
    @planes.push(plane)
    return true
  end

  def release(plane)
    @planes.delete(plane)
    return true
  end

  def cleared_for_takeoff?(plane)
    return :not_in_airport unless contains?(plane)
    return :weather unless weather_ok?
    return true
  end

  def cleared_for_landing?(plane)
    return :weather unless weather_ok?
    return true
  end

  def contains?(plane)
    @planes.any? { |plane_in_airport| plane_in_airport == plane }
  end

  def weather_ok?
    !@weather.stormy?
  end
end