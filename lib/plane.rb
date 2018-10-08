require_relative '../lib/weather.rb'
require_relative '../lib/airport.rb'

class Plane

  attr_reader :status

  def initialize(status = "flying")
    @status = status
  end

  def land(airport)
    current_weather = check_weather
    fail "Error: Adverse weather conditions" if (current_weather == "stormy")
    fail "Error: Already at airport" if (@status == "airport")
    fail "Error: Airport is full" if airport.full?
    @status = "airport"
    airport.hanger << self
  end

  def takeoff(airport)
    current_weather = check_weather
    fail "Error: Adverse weather conditions" if (current_weather == "stormy")
    fail "Error: Already flying" if (@status == "flying")
    fail "Error: Not at that airport" unless airport.hanger.include? self
    airport.hanger.delete(self)
    @status = "flying"
  end

  def check_weather
    weather = Weather.new
    weather.weather_generator
  end

end
