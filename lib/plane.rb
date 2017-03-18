class Plane

  def initialize(landed=false)
    @landed = landed
  end

  def land
    @landed = true
  end

  def landed?
    @landed
  end

end
