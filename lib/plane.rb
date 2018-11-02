
class Plane

  def land(airport)
    if airport.can_land?
      airport.planes << self unless airport.planes.include?(self)
    else
      puts "Stopped landing\n"
    end
  end

  def take_off(airport)
    if in_airport?(airport) && airport.weather_ok?
      airport.planes.delete(self)
      puts "Taking off and no longer in airport\n" 
    else
      puts "Stopped take off due to weather\n"
    end
  end

  def in_airport?(airport)
    airport.planes.include?(self)
  end

end
