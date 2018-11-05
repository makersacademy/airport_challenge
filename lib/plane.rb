
class Plane
  attr_accessor :location

  def initialize
    @location = ""
  end

  def land(airport)
    if airport.can_land?
      airport.planes << self unless airport.planes.include?(self)
      @location = "landed"
    else
      puts "Stopped landing\n"
    end
  end

  def take_off(airport)

    if !in_airport?(airport) && @location == "landed" && airport.weather_ok?
      puts "Can't take off from this airport" 
    end

    if in_airport?(airport) && airport.weather_ok? && @location == "landed"
      airport.planes.delete(self)
      @location = "flight"
      puts "Taking off and no longer in airport\n"
    elsif !in_airport?(airport) && @location == "flight"
      puts "Already in flight"
    elsif !airport.weather_ok?
      puts "Stopped take off due to weather\n"
    end

  end

  def in_airport?(airport)
    airport.planes.include?(self)
  end

end
