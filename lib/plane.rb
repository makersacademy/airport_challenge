require_relative 'airport'

class Plane

  def initialize
    @flying = false
  end

  def flying?
    @flying
  end

  def takeoff
    fail "Already flying!" if @flying
    @flying = true
  end

  def land
    fail "Already on the ground!" unless @flying
    @flying = false
  end

end