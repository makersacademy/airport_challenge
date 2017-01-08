require 'airport'

class Plane
attr_accessor :landed

  def initialize
    @landed = nil
  end

  def instruct_land(airport)
    airport_full(airport)
    prevent_landing(airport)
    airport::planes << self
    @landed = true
  end

  def instruct_takeoff(airport)
    prevent_takeoff(airport)
    airport::planes.delete(self)
    @landed = false
  end

  def prevent_takeoff(airport)
    raise "Denied: bad weather." if airport::stormy
  end

  def prevent_landing(airport)
    raise "Denied: bad weather." if airport::stormy
  end

  def airport_full(airport)
    raise "Denied: airport full." if airport::full
  end

end
