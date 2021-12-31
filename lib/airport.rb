require_relative 'weather_service'

class Airport
  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY, weather_service = WeatherService)
    @hangar = []
    @capacity = capacity
    @weather_service = weather_service
  end

  def receive(plane)
    fail "Sorry, Hangar Full" if full?
    check_weather
    @hangar << plane
  end

  def release(plane)
    check_weather
    @hangar.delete(plane)
  end
  
  private

  def check_weather
    fail "Sorry, Runways Closed, Storms Approaching" if @weather_service.alert?
  end

  def full?
    @hangar.count >= @capacity
  end
end
