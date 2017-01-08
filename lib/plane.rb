

class Plane
#require 'airport'
attr_accessor :landed

  def initialize
    @landed = nil
  end

  def instruct_land(airport)
    raise "Denied: plane already landed in airport." if airport::planes.include?(self)
    airport_full(airport)
    prevent_landing(airport)
    airport::planes << self
    @landed = true
  end

  def instruct_takeoff(airport)
    raise "Denied: plane not in airport." unless airport::planes.include?(self)
    raise "Denied: plane already in flight." if self::landed == false
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
