require_relative '../docs/weather.rb'
require_relative '../docs/airport.rb'
require 'pry'
# try and make current_weather @
class Plane

  attr_reader :status

  def initialize(status = "flying")
    @status = status
  end

  def land(airport)
    current_weather = check_weather
    fail "Error: Adverse weather conditions" if (current_weather == "stormy")
    fail "Error: Already at the airport" if (@status == "airport")
    fail "Error: Airport is full" if airport.full?
    @status = "airport"
    airport.hanger << self
  end

  def takeoff(airport)
    current_weather = check_weather
    fail "Error: Adverse weather conditions" if (current_weather == "stormy")
    fail "Error: Already flying" if (@status == "flying")
    @status = "flying"
    # need to delete plane from hanger when taken off
  end

  def check_weather
    weather = Weather.new
    weather.weather_generator
  end

end
