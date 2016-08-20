

class Plane

  def initialize
    @grounded = false
  end

  def landed
    @grounded = true
  end

  def taken_off
    @grounded = false
  end

end
