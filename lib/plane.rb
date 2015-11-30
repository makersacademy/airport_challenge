require_relative 'airport'
require_relative 'weather'

class Plane

  attr_reader :at_airport

  def initialize
    @flying = true
    @at_airport = nil
  end

  def land(airport)
    @flying = false
    @at_airport = airport
    @at_airport
  end

  def take_off
    @flying = true
  end

  def flying?
    @flying
  end

end
