class Controller
  attr_accessor :airport, :weather

  def initialize(airport, weather)
    @airport = airport
    @weather = weather
  end

  def capacity_reached
    @airport.full
  end

  def landing_enabled
    return false if weather.stormy?
    return false if airport.full?
    return true
  end

  def takeoff_enabled
    !weather.stormy?
  end
end
