class Plane

  attr_reader :airborne

  def initialize
    @airborne = true
  end

  def airborne?
    @airborne
  end

  def has_landed
    @airborne = false
  end

  def has_taken_off
    @airborne = true
  end

end
