require './lib/weather'

class Plane   
  attr_reader :current_location
  attr_reader :current_weather

  def initialize
    @current_weather
  end
  
  def take_off(weather)
    @current_weather = stormy(weather)
    fail 'Plane cannot take off if it is stormy' if @current_weather == "Storm"
    
    fail 'Plane already flying' if @current_location == ["flying"]

    @current_location = "flying"
  end

  def status(*location)
    @current_location = location
  end

  def land(weather)
    @current_weather = stormy(weather)
    fail 'Plane cannot land if it is stormy' if @current_weather == "Storm"

    fail 'Plane already landed' if @current_location == ["Airport"]

    @current_location = "Airport"
  end

  def stormy(weather) 
    @current_weather = weather.generate_weather
  end

end
