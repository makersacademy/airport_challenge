class Plane
  def land(airport)
    fail("Already Landed") unless in_flight?
    airport.receive(self)
    @airport = airport
  end

  def takeoff
    fail("Cannot Takeoff From The Sky") if in_flight?
    @airport.release(self)
    @airport = nil
  end

  def in_flight?
    !@airport 
  end
end
