require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :hanger, :capacity, :weather

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @hanger = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    return 'You cannot land due to the weather' if weather_at_airport == 'stormy'
    return 'Airport is full' if full?
    hanger.push(plane)
  end

  def full?
    hanger.count >= @capacity
  end

  def include?(plane)
    hanger.include?(plane)
  end

  def takeoff
    return 'You cannot takeoff due to the weather' if weather_at_airport == 'stormy'
    @hanger.pop
  end

  def weather_at_airport
    weather.todays_weather
  end
end
