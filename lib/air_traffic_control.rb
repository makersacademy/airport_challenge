# prevents landing and take off when guard conditions are not met
module AirTrafficControl
  def request_landing(plane)
    weather_guard
    capacity_guard
    clear_for_landing(plane)
  end

  def request_take_off(plane)
    weather_guard
    airport_guard(plane)
    clear_for_take_off(plane)
  end

  private

  def weather_guard
    raise WeatherError if weather_stormy?
  end

  def capacity_guard
    raise CapacityError if full?
  end

  def airport_guard(plane)
    raise AirportError unless contain?(plane)
  end

  def clear_for_landing(plane)
    planes << plane
  end

  def clear_for_take_off(plane)
    planes.delete(plane)
  end

  def weather_stormy?
    weather == :stormy
  end
end
