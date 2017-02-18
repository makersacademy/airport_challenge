require_relative 'airport'

class Plane

  attr_reader :airport

  def land(airport)
    if airport.request_to_land(self)
      @airport = airport
      true
    end
  end

  def take_off(airport)
    if airport.request_take_off(self)
      @airport = nil
      true
    end
  end

end
