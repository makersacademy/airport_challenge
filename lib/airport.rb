
class Airport

  attr_accessor :full, :capacity, :weather_is_stormy
  attr_reader :planes


  DEFAULT_CAPACITY = 9

  def initialize(capacity = DEFAULT_CAPACITY, random_weather = false)
    @planes = []
    @random_weather = random_weather
    @capacity = capacity
  end

  def weather_is_stormy?
    if @random_weather
      @weather_is_stormy = rand(1..7) > 5
    else
      @weather_is_stormy = false
    end
    @weather_is_stormy
  end

  def land(plane)
    raise "Plane can not land due to stormy weather" if self.weather_is_stormy?
    raise "Plane can not land because the airport is full" if self.is_full?
    raise "The plane is already landed" if @planes.include? plane
    @planes << plane

  end

  def take_off(plane)
    raise "Plane can not take off due to stormy weather" if self.weather_is_stormy?
    raise "The plane is already taken off" if !@planes.include? plane
    @planes.delete(plane)
  end

  def is_full?
    return true if @planes.count >= @capacity
    false
  end

end
