class Plane
  attr_reader :flying

  def initialize
    @flying = true
    @airport = nil
  end

  def land airport
    fail 'Plane already landed!' unless flying
    @airport = airport
    @flying = false
  end

  def take_off
    fail 'Plane already flying!' if flying
    @airport = nil
    @flying = true
  end

  def airport
    fail 'Plane is currently flying!' if flying
    @airport
  end
end
