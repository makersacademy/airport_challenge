require './lib/weather.rb'

class Plane   
  attr_reader :current_location
  def take_off
  end

  def status(*location)
    @current_location = location
  end

  def land
    fail 'Plane cannot take off if already flying' if @current_location == ["flying"]
    "TODO: plane to land"
  end

  def stormy?
    weather = Weather.new
    weather.generate_weather
    @currrent_weather
  end

# Plane.new.status("flying") test
# Plane.new.stormy

end

