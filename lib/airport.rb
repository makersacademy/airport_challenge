require_relative "plane"
class Airport
  DEFAULT_MAX_PLANES = 10

  def initialize
  	@capacity = DEFAULT_MAX_PLANES
    @planes = []
    @weather = set_weather
  end

  attr_accessor :capacity
  attr_reader :planes, :weather

  def ariving(plane)
  	weather = set_weather
  	fail "Cannot land, weather conditions too bad" if (weather == "Stormy")
  	fail "Cannot land, airport full" if full?
  	plane.land
  	planes << plane
  end

  def leaving(plane)
  	weather = set_weather
  	fail "The plane is not at this airport" if !planes.include?(plane)
  	fail "Cannot take off, weather conditions too bad" if (weather == "Stormy")
  	planes.delete(plane)
  	plane.take_off
  	plane
  end

  def set_weather
  	(rand(5) <= 3) ? "Sunny" : "Stormy"
  end

  def empty?
  	planes.length <= 0
  end

  def full?
  	planes.length >= capacity
  end

end
