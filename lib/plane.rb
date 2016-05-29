class Plane

  attr_reader :flying, :landed

  def initialize
    @flying = true
    @landed = false
  end

  def land(airport)
   fail 'Plane has already landed!' if landed == true
    @flying = false
    @landed = true
    airport.store(self)
  end

  def takeoff
  end

  def takeoff?
  end

end
