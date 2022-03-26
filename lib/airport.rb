
require_relative 'weather'
require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    check_capacity
    check_weather
    @planes << plane
    "Plane landed at airport"
  end

  def take_off(plane)
    fail "This plane is not in this airport" unless in_airport?(plane)
    check_weather
    @planes.pop
    "Plane has taken off from airport"
  end
    
  def in_airport?(plane)
    @planes.include?(plane)
  end

  def check_capacity
    fail "Airport is full" if full?
  end

  def check_weather
    fail "Cannot proceed due to storm" if weather.stormy?
  end

  def full?
    @planes.count >= @capacity
  end
end
