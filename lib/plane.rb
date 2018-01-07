class Plane

  attr_reader :airborne

  def initialize
    @airborne = true
  end

  def land
    fail unless @airborne
    @airborne = false
  end

  def takeoff
    fail if @airborne
    @airborne = true
  end

end
