require_relative 'airport'

class Plane

  def initialize
    @flying = true
  end

  def flying?
    return @flying
  end

  def land(airport)
    if @flying == false; fail "This plane has already landed"; end
    @flying = false
    @planes << self
    return nil
  end

  def take_off
    if @flying == true; fail "This plane is already airbourne"; end
    @flying = true
    return nil
  end
end
