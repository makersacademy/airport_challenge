class Plane
  attr_reader :landed

  def initialize
    @landed = true
  end

  def land
    raise 'Plane is already grounded!' if landed

    raise 'Weather is stormy' if stormy?

    @landed = true
    'Plane has landed'
  end

  def take_off
    raise 'Plane is already flying!' unless landed

    raise 'Weather is stormy' if stormy?

    @landed = false
    'Plane has taken off'
  end

  def stormy?
    rand(10) > 7
  end
end
