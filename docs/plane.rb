require_relative '../docs/weather.rb'
require 'pry'

class Plane

  def initialize(status = "flying")
     @status = status
  end

  def land
    current_weather = check_weather
    fail "Unable to land in these weather conditions" if (current_weather == "stormy")
    @status = "airport"
  end

  def takeoff
    current_weather = check_weather
    fail "Unable to takeoff in these weather conditions" if (current_weather == "stormy")
    fail "Error: Already flying" if (@status = "flying")
    @status = "flying"
  end

  def status
    @status
  end

  def check_weather
    weather = Weather.new
    weather.weather_generator
  end


end
