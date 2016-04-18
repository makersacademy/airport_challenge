class Plane

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

  private
  attr_accessor :landed

end
