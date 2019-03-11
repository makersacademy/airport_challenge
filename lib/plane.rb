class Plane

  def initialize
    @flying = true
  end

  def take_off
    raise 'Plane cannot take off; Plane flying already!'
  end

  def land(plane)
    raise 'Plane cannot fly; Grounded' unless @flying
    @flying = false
  end

  def airport
    raise 'Plane cannot be at airport; Plane flying already!'
  end
end
