require_relative './plane'
class Airport

  attr_reader :capacity
  attr_reader :planes
  attr_reader :weather_array

  def initialize(cap = 20)
    @capacity = cap
    @planes = []
  end

  def land(plane)
    number_of_planes = @planes
    fail 'Airport full' if @planes.size >= @capacity
    @planes.push(plane)
  end

  def take_off(plane)
    fail "Bad weather: No takeoff" if weather_safe? == 'sunny'
      @planes.pop
  end

  def weather_safe?
    @weather_array = ['sunny', 'sunny', 'sunny', 'sunny', 'stormy']
    current_weather = @weather_array[rand(weather_array.size)]
    puts current_weather
  end

end

c = Airport.new
c.take_off(Plane.new)
