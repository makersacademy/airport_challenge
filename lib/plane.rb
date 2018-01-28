require_relative 'airport'

class Plane

  attr_reader :current_airport

  def initialize
    @current_airport
  end

  def land(airport)
    if airport.weather == "stormy"
      fail "It's stormy here. Cannot land at this airport"
    else
      landing_sequence(airport)
    end
  end

  def take_off
    if @current_airport == nil
      fail "You are currently in flight"
    else
      take_off_sequence
      take_off_message
    end
  end

private

  def landing_sequence(airport)
    airport.planes << self
    @current_airport = airport
  end

  def take_off_sequence
    @current_airport.planes.delete(self)
    @current_airport = nil
  end

  def take_off_message
    print "Plane has left airport"
  end

end
