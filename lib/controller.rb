require_relative '../lib/weather'
require_relative '../lib/plane'
require_relative '../lib/airport'

class Controller
  attr_reader :airport, :weather

  def initialize 
    @airport = Airport.new
    @weather = Weather.new
  end

  def check_capacity
    !@airport.full?
  end

  def check_weather
    @weather.generate == :sunny
  end

  def check_landing(plane)
    return 'Sorry! The plane cannot land at the moment.' unless check_weather && check_capacity

    land(plane)
    puts 'successful landing.'
  end
  
  def check_takeoff(plane)
    return 'Sorry! The plane cannot take off at the moment.' unless check_weather

    takeoff(plane)
    puts 'take-off successful.'
  end

  def land(plane)
    @airport.ramp << plane
  end

  def takeoff(plane)
    @airport.ramp.delete(plane)
  end

end
