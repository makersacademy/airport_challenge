class Plane
  def initialize(airport = nil)
    @airport = airport
  end

  def land(airport)
    @airport = airport
    true
  end

  def take_off
    nil
  end
end
