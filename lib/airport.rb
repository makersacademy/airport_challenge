require 'weather'

class Airport
  attr_reader :plane 

  def land(plane)
    @plane = plane
  end

  def takeoff
    fail 'You cannot take off' if Weather.current == 'stormy'

    @plane = nil
  end
end
