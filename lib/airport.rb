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

    plane.land(self)
    @planes.push(plane) if check_weather != BAD_WEATHER
  end

  def take_off(plane)
    return "bad weather: plane has not left" if check_weather == BAD_WEATHER

    plane.take_off(self)

    raise "plane has not left" if plane.airport == self
    
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
