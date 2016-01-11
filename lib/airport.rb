require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :name, :max_capacity

  DEFAULT_CAPACITY = 34

  def initialize(max_capacity: DEFAULT_CAPACITY, name: "NoNameAirport", weather: weather)
    @planes = []
    @max_capacity = max_capacity
    @name = name
    @weather = weather
  end

  def approve_landing?(plane)
    fail "#{name} is full" if full?
    weather_check
    planes << plane
  end

  def approve_takeoff?(plane)
    fail "The plane is not at this airport" unless planes.include?(plane)
    weather_check
    planes.delete(plane)
  end

  private

  attr_writer :planes
  attr_reader :weather

  def full?
    planes.count >= @max_capacity
  end

  def weather_check
    fail "Bad weather, try again later" if weather.bad?
  end

end
