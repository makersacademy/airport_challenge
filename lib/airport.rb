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

    @planes.push(plane) if check_weather != BAD_WEATHER
  end

  def take_off(plane)
    return "bad weather: plane has not left" if check_weather == BAD_WEATHER

    @planes.delete(plane)
    return "plane has left"
  end

  def check_weather
    rand(100)
  end

private

  def full?
    @planes.count >= @capacity
  end
end
