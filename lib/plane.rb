class Plane

  def initialize
    @flying = true
  end

  def land(airport)
    @flying = false if airport.receive(self)
    !@flying
  end

  def flying?
    @flying
  end
  
end