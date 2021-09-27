require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5
  attr_accessor :capacity
  attr_reader :airport
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @airport = []
  end

  def full?
    @airport.size >= capacity
  end

  def check_hangers 
    fail "No Planes." if @airport.empty?
    puts "Plane ready for take-off"
  end

  def weather_station
    weather = Weather.new
    weather.clear?
  end

  def takeoff(plane)
    check_hangers
    if weather_station
      puts "Skies are clear. Plane taking off."
      airport.delete(plane)
    else
      puts "It's too stormy to fly"
    end
  end

  def land(plane)
    fail "No space" if full?
    @airport << plane
    puts "Plane has landed"
  end
end
