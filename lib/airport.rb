class Airport
  attr_reader :planes, :capacity
  BAD_WEATHER = 1
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "airport full" if full?
    if check_weather != BAD_WEATHER
      @planes.push(plane)
    end
  end

  def take_off(plane)
    if check_weather == BAD_WEATHER
      return "bad weather: plane has not left"
    else
      @planes.delete(plane)
      return "plane has left"
    end
  end

  def check_weather
    rand(100)
  end

private

  def full?
    @planes.count >= @capacity
  end
end
