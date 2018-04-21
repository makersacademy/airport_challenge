class Plane

  attr_reader :weather

  def land(airport)
    weather_warning
    storm_warning
    airport.planes.push(self)
  end

  def take_off(airport)
    weather_warning
    storm_warning
    airport.planes.delete(self)
  end

  def weather_report(weather) 
    @weather = weather
  end

  def weather_warning
    raise "Please check weather report before" if @weather.nil?
  end

  def storm_warning
    raise "Storm warning: cannot make that action" if @weather.stormy?
  end
end
