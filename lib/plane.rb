require_relative 'airport'

class Plane

  def initialize
    @flying = true
  end

  def take_off
    fail "Plane cannot take-off: plane already flying"
  end

  def land(airport)
    fail "Plane cannot land: already landed at this airport" if landed
    @flying = false
    @airport = airport
  end

  def airport
    @airport
  end

  private

  attr_reader :flying

  def landed
    !flying
  end

end