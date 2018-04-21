class Plane

  attr_reader :weather
  attr_accessor :status

  def initialize
    @status = "Flying"
  end

  def land(airport)
    check_status
    weather_warning
    airport_full_warning(airport)
    airport.planes.push(self)
    self.status = "Landed"
  end

  def take_off(airport)
    weather_warning
    check_if_in_airport(airport)
    airport.planes.delete(self)
    self.status = "Flying"
  end

  def weather_report(weather)
    @weather = weather
  end

  def weather_warning
    raise "Please check weather report before" if @weather.nil?
    raise "Storm warning: cannot make that action" if @weather.stormy?
  end

  def airport_full_warning(airport)
    raise "Airport full" if airport.planes.length == airport.capacity
  end

  def check_if_in_airport(airport)
    raise "Plane not in airport" unless airport.planes.include? self
  end

  def check_status
    raise "Plane already landed" if @status == "Landed"
  end
end
