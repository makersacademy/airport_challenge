require_relative '../docs/weather.rb'
require 'pry'

class Plane

  attr_reader :status

  def initialize(status = "flying")
    @status = status
  end

  def land
    current_weather = check_weather
    fail "Error: adverse weather conditions" if (current_weather == "stormy")
    fail "Error: Already at the airport" if (@status = "airport")
    @status = "airport"
  end

  def takeoff
    current_weather = check_weather
    fail "Error: adverse weather conditions" if (current_weather == "stormy")
    fail "Error: Already flying" if (@status = "flying")
    @status = "flying"
  end

  def check_weather
    weather = Weather.new
    weather.weather_generator
  end

end
