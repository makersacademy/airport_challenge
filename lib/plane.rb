class Plane

  attr_reader :airborne

  def initialize
    @airborne = false
  end

  def plane_status(status)
    status == :airborne ? @airborne = true : @airborne = false
  end

  def airborne?
    @airborne
  end

end
