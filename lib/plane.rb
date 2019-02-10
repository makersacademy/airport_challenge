class Plane

  attr_reader :landing_airport
  def initialize(flyingstatus = true)
    @flying = flyingstatus
  end

  def fly
    raise "This plane is already in flight" if isflying?

    @flying = true
    @landing_airport = nil
  end

  def isflying?
    @flying
  end

  def land(airport)
    raise "Plane already landed" if plane_at_airport(airport)
    raise "Plane at another airport" if plane_at_another_airport(airport)

    @flying = false
    @landing_airport = airport
  end

  def plane_at_airport(airport)
    !@flying && @landing_airport == airport
  end

  def plane_at_another_airport(airport)
    !@flying && @landing_airport != airport
  end

end
