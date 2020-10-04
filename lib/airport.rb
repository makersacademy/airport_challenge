require_relative "weather"
require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :landed_planes, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = nil
    @capacity = capacity
    @landed_planes = []
  end
  
  def place(plane)
    landed_planes << plane if first_airport?
  end

  def land(plane)
    check_weather
    fail 'The airport is at max capacity' if full?
    fail 'This plane has already landed' if landed?(plane)
    fail 'It is too stormy to land' if weather.stormy?
    
    landed_planes << plane
  end

  def take_off(plane)
    check_weather
    fail 'You are not in this airport' unless landed?(plane)
    fail 'It is too stormy to fly' if weather.stormy?

    landed_planes.delete(plane)
  end

  def check_weather
    condition = rand(1..10)
    @weather = Weather.new(condition)
  end

  private

  def first_airport?
    @weather.nil?
    landed_planes.count.zero?
  end

  def full?
    landed_planes.count == capacity
  end
  
  def landed?(plane)
    landed_planes.include?(plane)
  end

end
