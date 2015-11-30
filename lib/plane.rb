class Plane
  attr_reader :flying, :airport

  def initialize
    @flying = true
  end

  def land! airport
    fail 'Plane already landed!' unless flying?
    @airport = airport
    @flying = false
  end

  def take_off!
    fail 'Plane already flying!' if flying?
    @airport = nil
    @flying = true
  end

  def flying?
    flying
  end
end
