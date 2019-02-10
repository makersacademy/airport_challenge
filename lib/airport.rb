require_relative 'plane'

class Airport

  attr_accessor :hangar, :weather

  def initialize
    @hangar = []
    @weather = self.rain_or_shine
  end

  def rain_or_shine
    roll = rand(1..10)
    roll == 9 || roll == 10 ? "stormy" : "clear"
  end

end

# lear = Plane.new
# airbus = Plane.new
# gatwick = Airport.new
# lear.land(gatwick)
# airbus.land(gatwick)
# p gatwick.landed_planes
# lear.take_off
