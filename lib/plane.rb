require_relative 'airport'

class Plane

  def at_capacity_warning
    raise "Airport hangar at full capacity"
  end
  def at_capacity?(airport)
    airport.hangar_full?
  end
  def stormy_weather_warning
    raise "Warning! Stormy weather"
  end
  def stormy?(airport)
    airport.weather == 'stormy'
  end
  def take_off_message(airport)
    puts "#{self} has successfully taken-off from #{airport}" # need to figure out how to passe local variable as instance var
  end


  def land(airport)
    if stormy?(airport)
      stormy_weather_warning
    elsif at_capacity?(airport)
      at_capacity_warning
    else
    airport.hangar << self
    end
  end

  def take_off(airport)
    if stormy?(airport)
      stormy_weather_warning
    else
      airport.hangar.delete(self)
      take_off_message(airport)
    end
  end
end
