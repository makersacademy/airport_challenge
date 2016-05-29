require_relative 'airport'
require_relative 'passenger'
require_relative 'container'
require_relative 'weather'

class Plane
  include Container
  include Weather
  alias_method :old_initialize, :initialize

  def initialize(airport)
    old_initialize
    @current_location = airport
    airport.planes += 1
  end

  def take_off(airport)
    fail "Plane already airbourne!" if flying?
    fail "Weather stormy. Can't take off!" if stormy?
    fail "Plane can't take off from wrong location!" if airport != current_location
    @flying = true
    airport.planes -= 1
    "Plane has taken off and no longer at airport!"
  end

  def land(airport)
    fail "Plane can't land! Already grounded!" unless flying?
    fail "Plane can't land! Airport is full" if airport.full?
    fail "Weather stormy. Can't land!" if stormy?
    @flying = false
    airport.planes += 1
    @current_location = airport
    "Plane has landed at airport!"
  end

  private

  attr_reader :current_location

end

