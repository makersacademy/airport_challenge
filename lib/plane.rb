class Plane
  attr_reader :flying, :airport
  alias_method :flying?, :flying

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
end
