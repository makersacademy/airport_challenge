class AirTraffic
  attr_reader :planes, :airports

  def initialize
    @airports = [xja = Airport.new("xja", 15), 
                 khl = Airport.new("khl", 25), 
                 wtf = Airport.new("wtf",30)]
    @planes = [za915 = Plane.new("za915", xja, khl), 
               za943 = Plane.new("za943", khl, xja), 
               zj754 = Plane.new("zj754", wtf, xja)]
  end

  def interrogate(plane)
    plane.location
  end

  def land(plane, airport)
    plane.land(airport)
  end

  def takeoff(plane, destination_airport)
    plane.takeoff(destination_airport)
  end
end
