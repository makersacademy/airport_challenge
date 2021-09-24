class Airplane
  attr_reader :landed

  def initialize
    @landed = false
  end

  def landPlane
    @landed = true
  end

  def takeOff
    @landed = false
  end
end