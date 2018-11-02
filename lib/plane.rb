
class Plane

  def land(airport)
    if airport.weather && (airport.planes.length < 20)
      airport.planes << self if !airport.planes.include?(self)
    elsif airport.planes.length >= 20
      puts "Airport is full\n"
    else
      puts "Stopped landing due to weather\n"
    end
  end

  def take_off(airport)
    if in_airport?(airport) && airport.weather
      airport.planes.delete(self)
      puts "Taking off and no longer in airport\n" 
    else
      puts "Stopped take off due to weather\n"
    end
  end

  def prevent_takeoff
  end

  def in_airport?(airport)
    airport.planes.include?(self)
  end

end
