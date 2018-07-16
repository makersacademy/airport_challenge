require_relative './plane'
class Airport

  attr_reader :capacity
  attr_reader :planes
  attr_reader :current_weather

  def initialize(cap = 20)
    @capacity = cap
    @planes = []
  end

  def land(plane)
    number_of_planes = @planes
    fail 'Airport full' if @planes.size >= @capacity
    @planes << plane
  end

  def take_off(plane)
    fail "Bad weather: No takeoff" if @current_weather == 'sunny'
      @planes.pop
  end

  def weather_safe?
    @current_weather = puts ['sunny', 'sunny', 'sunny', 'sunny', 'stormy'][rand(weather_array.size)]
  end

end
