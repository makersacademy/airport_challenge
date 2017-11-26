class Plane
  attr_accessor :grounded, :airport
  def initialize
    @grounded = true
  end

  def land(airport)
    raise "Already grounded" if grounded
    #airport.receive(self)
    self.grounded = true
    self.airport = airport
  end

  def takeoff
    raise "Already flying" unless grounded
    self.grounded = false
  end
end
