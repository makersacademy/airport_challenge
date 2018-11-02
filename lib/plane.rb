require_relative 'airport'

class Plane
  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land(airport)
    fail 'Plane has already landed' if landed?
    @landed = true
    airport.hangar << self
  end

  def landed?
    @landed
  end

end
