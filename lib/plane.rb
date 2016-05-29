require_relative 'airport'

class Plane

  def initialize
    @landed = false
  end

  def land(airport)
    @landed = true
  end

  def take_off(airport)
    @landed = false
  end

  def landed?
    @landed
  end

end
