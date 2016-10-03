require_relative 'airport'

class Plane

  attr_reader :status

  def initialize
    @status = 'in flight'
  end

  def land(airport)
    airport.clear_landing(self)
    @status = 'landed'
  end

  def takeoff(airport)
    airport.clear_takeoff(self)
    @status = 'in flight'
  end
end
