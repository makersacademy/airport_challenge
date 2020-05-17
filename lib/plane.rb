require './lib/airport.rb'

class Plane
  def land(airport)
    @airport = airport
  end
  
  def take_off
    "Plane has departed the airport"
  end

  def has_space_to_land?
    if @airport == nil
      return true
    else
      return false
    end
  end

end
