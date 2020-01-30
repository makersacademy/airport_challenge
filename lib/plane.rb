require './lib/weather.rb'

class Plane   
  attr_reader :current_location
  attr_reader :current_weather

  def initialize
    @current_weather = "Not Storm"
  end
  
  def take_off
    fail 'Plane cannot take off if it is stormy' if @current_weather == "Storm"
    
    fail 'Plane already flying' if @current_location == ["flying"]

    @current_location = "flying"
  end

  def status(*location)
    @current_location = location
  end

  def land
    # stormy must be run before land or take off to change current location
    fail 'Plane already landed' if @current_location == ["Airport"]

    fail 'Plane cannot land if it is stormy' if @current_weather == "Storm"

    @current_location = "Airport"
  end

  def stormy(weather) 
    # TODO - ensure variable passed is weather.new ~ does work in feature test
    @current_weather = weather.generate_weather
  end

  # def generate_weather

end
