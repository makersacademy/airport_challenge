class Plane
  def initialize(airport = nil)
    @airport = airport
  end
  
  def land(airport)
    @airport = airport
    true
  end
end
