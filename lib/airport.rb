class Airport
  DEFAULT_CAPACITY = 5

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "The airport has no capacity." if full?
    raise "The Plane can't land it is too stormy." if weather_unsafe?
    plane.flying = false
    @planes << plane
  end

  def take_off
    raise "The Plane can't take off it is too stormy." if weather_unsafe?
    plane = @planes.pop
    plane.flying = true
    return plane
  end

  private
  
  def full?
    return true if @planes.count >= @capacity
  end

  def weather_unsafe?
    return true if @weather == "Stormy"
  end

end
