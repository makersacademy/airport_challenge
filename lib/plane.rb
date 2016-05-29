require_relative 'airport'
require_relative 'passenger'
require_relative 'container'
require_relative 'weather'

class Plane
  include Container
  include Weather

  def take_off
    fail "Plane already airbourne!" if flying?
    fail "Weather stormy. Can't take off!" if stormy?
    @flying = true
    "Plane has taken off and no longer at airport!"
  end

  def land(airport)
    fail "Plane can't land! Already grounded!" unless flying?
    fail "Plane can't land! Airport is full" if airport.full?
    fail "Weather stormy. Can't land!" if stormy?
    @flying = false
    "Plane has landed at airport!"
  end
end