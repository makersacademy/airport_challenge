class Plane

  attr_reader :landed

  def initialize(landed = false)
    @landed = landed
  end

  def lands
    @landed = true
  end

  def takes_off
    @landed = false
  end

end
