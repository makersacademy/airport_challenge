class Plane
  attr_accessor :landed

  def initialize(landed = false)
    @landed = landed
  end

  def land
    @landed = true
  end

  def take_off
    @landed = false
  end

  def landed?
    @landed
  end

end
