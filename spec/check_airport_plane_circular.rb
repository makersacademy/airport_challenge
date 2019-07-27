class Airport
  attr_accessor :planes
  def initialize
    @planes = []
  end
end
class Plane
  attr_accessor :airport
end


pl = Plane.new
ap = Airport.new

pl.airport = ap

ap.planes << pl

p pl
p ap

p pl.airport
p ap.planes
p ap.planes[0].airport