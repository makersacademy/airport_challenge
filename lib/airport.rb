require "./lib/airplane.rb"

class Airport
  attr_reader :airplanes, :capacity
  DEFAULT_CAPACITY = 7

  def initialize
    @airplanes = []
    @capacity = DEFAULT_CAPACITY
  end

  def random_weather
    weather = ["sunny", "cloudy", "windy","rainy", "stormy"]
    weather[rand(weather.size)]
  end
  
  def land(airplane)
    #random_weather
    #p random_weather
    #fail 'Too stormy to land' if stormy?
    fail 'The airport is full' if full?
    @airplanes << airplane
  end
  
  def take_off(airplane)
    random_weather
    #p random_weather
    fail 'The airport is empty' if empty?
    fail 'Too stormy to takeoff' if stormy?
    @airplanes.pop
  end

  private
  attr_reader :airplanes

  def full?
    @airplanes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @airplanes.empty?
  end

  def stormy?
    random_weather == "stormy"
  end
end
