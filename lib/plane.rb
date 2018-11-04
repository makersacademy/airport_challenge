
class Plane
  attr_accessor :airport

  def initialize
    @airport = nil
  end

  def land(airport)
    if airport.can_land?
      airport.planes << self unless airport.planes.include?(self)
      @airport = airport
    else
      puts "Stopped landing\n"
    end
  end

  def take_off(airport)
    if in_airport?(airport) && airport.weather_ok? && airport == @airport
      airport.planes.delete(self)
      @airport = nil
      puts "Taking off and no longer in airport\n" 
    elsif airport != @airport
      puts "Can't take off from this airport"
    elsif in_airport?(airport) == false
      puts "Already taken off"
    else
      puts "Stopped take off due to weather\n"
    end
  end

  def in_airport?(airport)
    airport.planes.include?(self)
  end

end
