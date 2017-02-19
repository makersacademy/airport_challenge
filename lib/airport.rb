require_relative 'weather_generator'
class Airport

  DEFAULT_CAPACITY = 5
  DEFAULT_STORM_PROBABILITY = 10
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY, storm_probability = DEFAULT_STORM_PROBABILITY)
    @capacity = capacity
    @storm_probability = storm_probability
    @planes = []
  end

  def land_plane(plane)
    raise "This plane is already on the ground." if plane.landed?
    raise "Sorry, this airport is full." if full?
    raise "The weather at the airport is stormy, you cannot land." unless sunny?
    plane.land(self)
    @planes << plane
    plane
  end

  def permit_takeoff(plane)
    raise "This plane is already in the air." unless plane.landed?
    raise "The weather at the airport is stormy, you cannot takeoff." unless sunny?
    raise "This plane is at a different airport." unless @planes.include?(plane)
    plane.takeoff
    @planes.delete(plane)
    plane
  end

  def sunny?
    @weather_generator = WeatherGenerator.new
    return true unless generator = @weather_generator.generate_random_weather(@storm_probability) == 0
  end

  def full?
    planes.length >= capacity
  end

end
