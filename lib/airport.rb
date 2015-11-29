require_relative = 'plane'
require = 'weather'

class Airport

  attr_accessor :planes
  attr_reader :name, :max_capacity

  DEFAULT_CAPACITY = 34

  def initialize(max_capacity: DEFAULT_CAPACITY, name: "NoNameAirport")
    @planes = []
    @max_capacity = max_capacity
    @name = name
  end

  def approve_landing?(plane)
    fail "#{name} is full" if full?
    fail bad_weather_message if bad_weather
    planes << plane
  end

  def approve_takeoff?(plane)
    fail "The plane is not at this airport" unless planes.include?(plane)
    fail bad_weather_message if bad_weather
    planes.delete(plane)
  end

  def full?
    planes.count >= @max_capacity
  end

  def bad_weather
    true if rand(1..5) == 1
  end

  def bad_weather_message
    "Bad weather, try again later"
  end

end
