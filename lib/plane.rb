require_relative 'airport'

class Plane

  def at_capacity_warning(airport)
    raise "Airport hangar at full capacity" if airport.hangar_full?
  end
  def stromy_weather_warning(airport)
    raise "Warning! Stormy weather" if airport.weather == 'stormy'
  end

  def land(airport)
    stromy_weather_warning(airport)
    at_capacity_warning(airport)
    airport.hangar << self
  end

  def take_off(airport)
    airport.hangar.delete(airport)
    successful_take_off(airport)
  end

  def successful_take_off(airport)
    puts "#{self} has successfully taken-off from #{airport}" # need to figure out how to passe local variable as instance var
  end

end
