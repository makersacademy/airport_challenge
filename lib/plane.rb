class Plane

  attr_reader :airborne

  def initialize
    @airborne = false
  end

  def landed?
    true
  end

  def plane_status(status)
    status == "airborne" ? @airborne = true : "landed"
  end

  def airborne?
    @airborne
  end

end
