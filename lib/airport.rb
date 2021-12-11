require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_landing(plane)
    raise "AIRPORT AT FULL CAPACITY!" if at_capacity?
    raise "STORMY WEATHER: CANNOT LAND" if check_weather == "Stormy"
    @planes << plane
  end

  def instruct_take_off
    raise "STORMY WEATHER: CANNOT TAKE OFF" if check_weather == "Stormy"
    @planes.pop
  end

  def check_weather
    weather_report = ["Sunny", "Stormy", 
    "Sunny", "Sunny", "Sunny"]

    weather_report[rand(weather_report.size)]
  end

  private

  def at_capacity?
    @planes.size >= DEFAULT_CAPACITY
  end

end
