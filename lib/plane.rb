require_relative 'airport'

class Plane

  def land(airport)
    if airport.full?
      raise 'Landing prevented: Airport full'
    else
      airport.send_to_hangar(self)
      airport
    end
  end

  def take_off(airport)
    airport.taxi_to_runway(self)
    return "#{self} is no longer in #{airport}" if airport.hangar == ""
  end
end
