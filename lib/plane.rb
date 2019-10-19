class Plane
  attr_reader :airport

  def initialize(status = true)
    @flying = status
  end

  def flying?
    @flying
  end

  def land(airport)
    raise "Plane not flying" unless flying?

    @flying = false
    @airport = airport
  end

  def takeoff
    raise "Plane flying, cannot take off" if flying?
    
    @flying = true
    @airport = ""
  end
end
