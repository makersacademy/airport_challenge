require_relative '../lib/airport.rb'

class Plane
  def initialize
    @flying
  end  

  def land(airport)
    if @flying == false
      "This plane has already landed!"
    else  
      if airport.planes.length < airport.MAX_CAPACITY
        if randWeather == "Sunny" 
          @flying = false
          airport.planes.unshift(self) 
        else 
          "Plane unable to land due to stormy weather"
        end  
      else
        "Plane cannot land, airport is at full capacity"
      end  
    end  
  end

  def take_off(airport)
    if @flying == true
      "This plane is already flying!"
    else  
      if randWeather == "Sunny"
        @flying = true
        airport.planes.shift(0) 
      else 
        "Plane unable to take off due to stormy weather"
      end  
    end  
  end

  def at_airport?(airport)
    if airport.planes.include?(self)
      "Plane is at this airport"
    else
      "Plane is not at this airport"
    end  
  end

  def randWeather
    options = ["Sunny", "Sunny", "Sunny", "Stormy"]
    return options.sample
  end
end  

