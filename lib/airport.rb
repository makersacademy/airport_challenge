require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5
  attr_accessor :capacity
  attr_reader :hangar
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def full?
    hangar.size >= capacity
  end

  def check_hangers 
    fail "No Planes." if hangar.empty?
    puts "Plane ready for take-off"
  end

  def takeoff(plane)
    check_hangers
    if weather_station
      puts "It's too stormy to fly"
    else
      puts "Skies are clear. Plane taking off."
      hangar.delete(plane)
      @capacity += 1
    end
  end

  def land(plane)
    fail "No space" if full?
    if weather_station
      puts "Too stormy to land. Go around."
    else
      puts "Skies are clear. Plane can land."
      hangar << plane
      @capacity -= 1
    end
  end

  private

  def weather_station
    weather = Weather.new
    weather.stormy?
  end
end
