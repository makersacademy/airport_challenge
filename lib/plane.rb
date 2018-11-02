require './lib/weather.rb'

class Plane
  attr_reader :flying
  attr_reader :landed_in

  def land(airport)
    if airport.receive_plane(self)
      @flying = false
      @landed_in = airport
      return "Plane has landed"
    else
      return "Airport is full"
    end
  end

  def fly
    if landed_in.release_plane(self)
      @flying = true
      @landed_in = nil
      return "Plane has taken off"
    else
      return "Plane could not take off due to weather"
    end
  end



end
