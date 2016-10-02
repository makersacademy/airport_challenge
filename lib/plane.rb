require_relative 'airport'
require_relative 'weather'

class Plane
  attr_reader :landed
  attr_accessor :current_airport

  def initialize(airport)
    @landed = true
    @current_airport = airport
  end

  def land(airport)
    fail 'This plane has already landed' if @landed == true
      airport.receive_plane(self)
  end

  def successful_landing(airport)
    @landed = true
    @current_airport = airport
  end

  def takeoff(airport)
    fail 'This plane is already in flight' if landed == false
      fail 'This plane is not at that airport' if airport != current_airport
      airport.release_plane(self)
  end

  def successful_takeoff
    @landed = false
    @current_airport = ''
  end

end
