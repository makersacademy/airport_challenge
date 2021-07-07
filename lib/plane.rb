class Plane

  attr_reader :landed

  def initialize 
    @landed = false
  end

  def flying?
    !@landed
  end

  def land
    @landed = true
  end

  def take_off
    @landed = false
  end

end
