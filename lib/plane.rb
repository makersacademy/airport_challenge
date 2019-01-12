class Plane

  attr_reader :landed

  def initialize(landed = true)
    @landed = landed
  end

  def lands
    @landed = true
  end

  def takes_off
    @landed = false
  end

end
