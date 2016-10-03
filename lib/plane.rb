class Plane

attr_accessor :grounded

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
