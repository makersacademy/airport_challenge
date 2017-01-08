class Plane

attr_accessor :landed

  def initialize
    @landed = nil
  end

  def instruct_land(airport)
    airport::planes << self
    @landed = true
  end

  def instruct_takeoff(airport)
    prevent_takeoff
    airport::planes.delete(self)
    @landed = false
  end

  def prevent_takeoff
#    raise "Denied: bad weather." if stormy?
  end

end
