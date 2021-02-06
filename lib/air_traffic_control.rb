module AirTrafficControl
  def request_landing
    weather_guard
    capacity_guard
  end

  def request_take_off(plane)
    weather_guard
    airport_guard(plane)
  end

  private

  def capacity_guard
    raise CapacityError if full?
  end

  def airport_guard(plane)
    raise AirportError if not_contain?(plane)
  end

  def weather_guard
    raise WeatherError if weather_stormy?
  end

  def weather_stormy?
    weather == :stormy
  end
end
