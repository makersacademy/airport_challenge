# prevents landing and take off when guard conditions are not met
module AirTrafficControl
  def request_landing(plane)
    raise WeatherError if weather_stormy?
    raise CapacityError if full?
    planes << plane
  end

  def request_take_off(plane)
    raise WeatherError if weather_stormy?
    raise AirportError unless contain?(plane)
    planes.delete(plane)
  end

  private

  def weather_stormy?
    weather_forcast == :stormy
  end
end
