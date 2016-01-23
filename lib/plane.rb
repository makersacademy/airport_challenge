class Plane

  attr_reader :clearance

  def initialize
    @clearance = false
  end

  def request_clearance(airport)
    @clearance = true if airport.clearance?
  end

end
