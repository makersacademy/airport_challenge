# Plane instances only have a 'landed' parameter which is updated when the
# plane receives instructions to land or take off. 
class Plane

  attr_reader :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def take_off
    @landed = false
  end

end
