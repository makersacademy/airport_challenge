require './lib/airport.rb'

class Plane

  def land(airport)
    if airport.weather.stormy?
      "Cannot land, adverse weather."
    else
      airport.hangar << self
      "The plane has landed."
    end
  end

  def take_off(airport)
    if airport.weather.stormy?
      "Cannot take off, adverse weather"
    else
      airport.hangar.delete(self) # .include? for multiple planes
      "Plane has left."
    end
  end
end
