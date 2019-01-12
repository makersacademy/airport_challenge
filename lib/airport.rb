require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @airport = []
  end

  def land(plane)
    @airport << plane
  end

  def take_off(weather)
    if weather != "sunny"
      fail 'Take off not authorised'
    end
    @airport.pop
    'Plane no longer in the airport'
  end
end
