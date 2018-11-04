require './lib/weather.rb'

class Plane
  attr_reader :flying
  attr_reader :landed_in

  def initialize(flying = nil)
    @flying = flying
  end

  def land(airport)
    fail "Plane already in airport" if @landed_in
    error_message = airport.receive_plane(self)
    return error_message if error_message
    @flying = false
    @landed_in = airport
    return "Plane has landed"
  end

  def fly
    fail "Already flying" if @flying
    return "Plane could not take off due to weather" unless
            landed_in.release_plane(self)
    if landed_in.release_plane(self)
      @flying = true
      @landed_in = nil
      return "Plane has taken off"
    else

    end
  end

end
