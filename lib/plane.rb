# Plane class
class Plane
  def initialize
    @airborne = true
  end

  def taken_off
    @airborne = true
  end

  def landed
    @airborne = false
  end

  attr_reader :airborne
end
