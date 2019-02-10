require_relative 'plane'

class Airport

  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  
end

# lear = Plane.new
# airbus = Plane.new
# gatwick = Airport.new
# lear.land(gatwick)
# airbus.land(gatwick)
# p gatwick.landed_planes
# lear.take_off
