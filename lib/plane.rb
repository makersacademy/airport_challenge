class Plane
  attr_reader :landed

  def initialize
    @landed = true
  end

  def land
    raise 'Plane is already grounded!' if landed
    @landed = true
    'Plane has landed'
  end

  def take_off
    raise 'Plane is already flying!' if !landed
    @landed = false
    'Plane has taken off'
  end
end
