class AirTraffic
  attr_reader :planes, :airports

  def initialize
    @planes = [za915 = Plane.new, za943 = Plane.new, zj754 = Plane.new]
    @airports = [xja = Airport.new, khl = Airport.new, wtf = Airport.new]
  end

  def interrogate(plane)
    plane.location
  end

  def land(plane, airport)
    plane.land(airport)
  end

  def takeoff(plane, airport)
    plane.takeoff(airport)
  end
end
