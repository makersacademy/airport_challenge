require_relative 'airport'

class Plane

  attr_reader :docked_at

  def initialize
    @docked_at = nil
  end

  def land(airport)
    airport.landing(self)
    @docked_at = airport
  end

  def takeoff(airport)
    airport.depart(self)
    @docked_at = nil
  end

end
