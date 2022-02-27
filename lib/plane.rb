class Plane

  def initialize
    @flying = true
  end

  def land(airport)
    @flying = false if airport.receive(self)
  end

  def flying?
    @flying
  end
  
end