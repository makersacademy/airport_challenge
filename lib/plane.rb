class Plane

  attr_reader :weather

  def land(airport)
    airport.planes.push(self)
  end

  def take_off(airport)
    weather_warning
    raise "Plane cannot take off in the storm" if @weather.stormy?
    airport.planes.delete(self)
  end

  def weather_report(weather) #automating different weather would be
    @weather = weather
  end

  def weather_warning
    raise "Please check weather report before" if @weather.nil?
  end
end
