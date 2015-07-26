require_relative "plane"
class Airport
  DEFAULT_MAX_PLANES = 10

  def initialize
  	@capacity = DEFAULT_MAX_PLANES
    @plane = []
    @weather = set_weather
  end

  attr_accessor :capacity

  def ariving(plane)
  	@weather = set_weather
  	fail "Cannot land, weather conditions too bad" if (@weather == "Stormy")
  	fail "Cannot land, airport full" if full?
  	@plane << plane
  end

  def leaving
  	@weather = set_weather
  	fail "Cannot take off, weather conditions too bad" if (@weather == "Stormy")
  	@plane.pop
  end

  def set_weather
  	(rand(5) <= 3) ? "Sunny" : "Stormy"
  end

  def empty?
  	@plane.length <= 0
  end

  def full?
  	@plane.length >= capacity
  end

end
