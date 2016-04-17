class Plane

attr_accessor :landed

  def initialize(landed = true)
    @landed = landed
  end

  def land
    @landed = true
  end

  def take_off
    @landed = false
  end

  def docked?
    landed
  end

end
