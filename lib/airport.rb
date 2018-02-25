require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :capacity, :planes_now

  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes_now = []
  end

  def landing(plane, weather)
    raise Exception.new("Airport full, landing denied") if @planes_now.length == @capacity
    raise Exception.new("Bad weather, landing denied") unless weather.weather_ok?

    @planes_now << plane
    puts "#{plane} has landed"
  end

  def allow_takeoff(plane, weather)
    raise Exception.new("Bad weather, takeoff denied") unless weather.weather_ok?
    @planes_now.delete(plane)
    puts "#{plane} has taken off"
  end
end
