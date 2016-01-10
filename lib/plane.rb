class Plane


  attr_reader :flying, :airport

  def initialize
    @flying = false
  end

  def land(airport)
    @flying = false
    @airport = airport
  end

  def take_off(airport)
    @flying = true
    @airport = nil
  end
end
