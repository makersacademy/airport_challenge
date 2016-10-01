require_relative 'airport'

class Plane
  attr_reader :landed
  attr_accessor :current_airport

  def initialize
    @landed = true
  end

  def land(airport)
    airport.receive_plane(self)
  end

  def set_airport(airport)
    @current_airport = airport
  end

  def takeoff(airport)
    fail 'This plane is not at that airport' if airport != current_airport
    @landed = false
    airport.release_plane(self)
  end

end
