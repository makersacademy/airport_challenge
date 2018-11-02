
class Plane

  def land(airport)
    airport.planes << self
  end

  def take_off(airport)
    if in_airport?(airport) && airport.weather
      airport.planes.delete(self)
      puts "Taking off and no longer in airport\n" 
    else
      puts "Stopped take off\n"
    end
  end

  def prevent_takeoff
  end

  def in_airport?(airport)
    airport.planes.each do |plane|
      if plane == self
        true
      else
        false
      end
    end
  end

end
