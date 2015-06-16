class Plane
  attr_accessor :airborne

  def initialize
    self.airborne = true
  end

  def airborne?
    airborne
  end

  def grounded?
    !airborne
  end

  def land
    self.airborne = false
  end

  def take_off
    self.airborne = true
  end

end
