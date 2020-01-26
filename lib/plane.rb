require './lib/weather.rb'

class Plane   
  attr_reader :current_location
  attr_reader :current_weather
  def take_off
  end

  def status(*location)
    @current_location = location
  end

  def land
    fail 'Plane cannot take off if already flying' if @current_location == ["flying"]
    fail 'Plane cannot take off if it is stormy' if stormy? == true
    p "TODO: plane to land"
  end

  def stormy?
    weather = Weather.new
    @currrent_weather = weather.generate_weather
    if @currrent_weather == "Storm"
      true
    else
      false
    end
  end

# Plane.new.status("flying") test
# test_flight = Plane.new

end

