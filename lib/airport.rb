require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :current_weather, :name, :runway, :capacity, :landed_at

  def initialize(name = 'the Airport', cap = 10)
    @name = name
    @runway = []
    @capacity = cap
    @current_weather = Weather.new(self)

  end

  def land_plane(plane)
    landing_check(plane)
    @runway << plane
  end

  def takeoff_plane(plane)
    takeoff_check
    @runway.delete(plane)
  end

  def full?
    runway.count >= capacity ? true : false
  end

  def takeoff_check
    @current_weather = generate_weather
    fail "Cannot takeoff, weather at #{name} stormy" if @current_weather.condition == "Stormy"
  end

  def landing_check(plane)
    @current_weather = generate_weather
    fail "Cannot land, weather at #{name} stormy" if @current_weather.condition == "Stormy"
    fail "Already landed at #{name}" if @runway.include?(plane)
    fail "Cannot land, airport full" if full?
  end

  private
  def generate_weather
    Weather.new(self)
  end

end
