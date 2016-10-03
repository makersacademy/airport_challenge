require_relative 'airport'

class Plane

attr_reader :landed
  def initialize
    @landed = false
  end

  def landing_to(airport)
    airport
  end

  def landed?
    @landed
  end

  def take_off
  end

end
