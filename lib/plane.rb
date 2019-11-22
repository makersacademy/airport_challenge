class Plane
  attr_reader :airport

  def initialize
    @flying = true
    @airport = nil
  end

  def flying?
    @flying
  end

  def land(airport)
    @flying = false
    @airport = airport
  end

  def take_off
    @flying = true
    @airport = nil
  end

end
