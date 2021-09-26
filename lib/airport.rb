require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :airport

  def initialize
    @airport = []
  end

  def full?
    @airport.length
  end

  def check_hangers 
    if @airport.empty?
      puts "Error. There are no planes to take off."
    else
      puts "Plane ready for take-off"
    end
  end

  def weather_station
    Weather.new.forecast
  end

  def takeoff(plane)
    check_hangers
    if weather_station
      puts "Skies are clear. Plane taking off."
      plane
    else
      puts "It's too stormy to fly"
    end
  end

  def land(plane)
    @airport << plane
    puts "Plane has landed"
    plane
  end
end
