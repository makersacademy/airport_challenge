require_relative './plane'
class Airport

  attr_reader :capacity
  attr_reader :planes
  attr_reader :current_weather

# sorting the weather
  weather_array = ['sunny', 'sunny', 'sunny', 'sunny', 'stormy']
  @current_weather = weather_array[rand(5)]

  def initialize(cap = 20)
    @capacity = cap
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if @planes.size >= @capacity
    @planes << plane
  end

  def take_off(_plane)
    fail "Bad weather: No takeoff" if @current_weather == 'sunny'
    @planes.pop
  end
end
