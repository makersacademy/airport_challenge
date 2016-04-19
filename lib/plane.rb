class Plane

  attr_reader :landed


  def initialize
    @landed = false
  end
  def ground
    @landed = true
  end


end

