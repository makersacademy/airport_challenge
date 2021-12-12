require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_landing(plane)
    raise "AIRPORT AT FULL CAPACITY!" if at_capacity?
    raise "STORMY WEATHER: CANNOT LAND" if check_weather == "Stormy"
    @planes << plane
  end

  def instruct_take_off(plane)
    raise "STORMY WEATHER: CANNOT TAKE OFF" if check_weather == "Stormy"
    plane = @planes.pop
  end

  def check_weather
    rand(1..10) < 8 ? "Sunny" : "Stormy" 
  end
  
  private

  def at_capacity?
    @planes.size >= capacity
  end

end
