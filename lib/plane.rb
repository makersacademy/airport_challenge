require_relative 'airport'

class Plane

  attr_reader :airport

  def land(airport)
    if airport.request_to_land(self)
      @airport = airport
      true
    end
  end

end
