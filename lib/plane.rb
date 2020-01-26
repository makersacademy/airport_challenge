require './lib/weather.rb'

class Plane   
  attr_reader :current_location
  attr_reader :current_weather
  def take_off
    fail 'Plane cannot take off if it is stormy' if @current_weather == "Storm"
    fail 'Plane cannot take off if already flying' if @current_location == ["flying"]
    @current_location = "flying"
  end

  def status(*location)
    @current_location = location
  end

  def land
    fail 'Plane cannot land if already landed' if @current_location == ["Airport"]
    fail 'Plane cannot land if it is stormy' if @current_weather == "Storm"
    p "TODO: plane to land, location to change"
    @current_location = "Airport"
  end

  def stormy
    weather = Weather.new
    @current_weather = weather.generate_weather
  end

# Plane.new.status("flying") test
 #test_flight = Plane.new
 #p test_flight.stormy?
 #p test_flight.land
end

