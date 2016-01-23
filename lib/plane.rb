class Plane

  attr_reader :clearance

  def initialize
    @clearance = false
  end

  def request_clearance(airport)
    airport.clearance?
  end

end
