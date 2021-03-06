class AirTraffic
  attr_reader :planes, :airports

  def initialize
    @planes = [za915 = Plane.new, za943 = Plane.new, zj754 = Plane.new]
    @airports = [xja = Airport.new, khl = Airport.new, wtf = Airport.new]
  end

  def instruction(plane, airport)
    airport.land(plane)
  end
end
