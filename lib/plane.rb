require './lib/airport.rb'

class Plane
@self = self


  def land(airport)
    if airport.weather.stormy?
      "Cannot land, adverse weather."
    else
      "The plane has landed."
    end
  end

  def take_off
    "Plane has left."
  end
end
