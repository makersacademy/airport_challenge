require_relative 'airport'

class Plane

  attr_reader :current_airport

  def initialize
    @current_airport = nil
  end

  def land(airport)
    airport.planes << self
    @current_airport = airport # array of planes at current airport
  end

  def take_off
    @current_airport.planes.delete(self)
    @current_airport = nil
    # remove self from airport.planes array
    take_off_message
  end

private

  def take_off_message
    print "Plane has left airport"
  end

end
