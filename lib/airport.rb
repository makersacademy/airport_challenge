class Airport
  attr_accessor :capacity
  attr_reader :planes

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Weather too stormy for landing" if poor_weather
    
    fail 'Airport full' if full

    planes << plane
  end

  def take_off(plane)
    fail "Weather too stormy for take-off" if poor_weather

    planes.delete(plane)
    "#{plane} has taken off"
  end

  def weather
    possible_weather = ["sunny", "sunny", "sunny", "sunny", "sunny", "stormy"]
    possible_weather[rand(6)]
  end

  private

  def full
    planes.count >= capacity
  end

  def poor_weather
    weather == "stormy"
  end
end
