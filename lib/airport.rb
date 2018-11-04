
class Airport
  attr_accessor :planes, :weather, :capacity
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
    @weather = "random_weather"
    random_weather
  end

  def can_land?
    weather_ok? && !full?
  end

  def full?
    @planes.length >= @capacity
  end

  def weather_ok?
    if @weather === "sunny"
      true 
    elsif @weather == "stormy"
      false
    end
  end

  def random_weather
    if rand(1..10) > 7
      @weather = "stormy" 
    else 
      @weather = "sunny" 
    end
  end

end
