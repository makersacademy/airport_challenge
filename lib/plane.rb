class Plane

  def initialize
    @landed = true #assuming planes are built
  end

  def landed
    @landed = true
  end

  def landed?
    @landed
  end

  def taken_off
    @landed = false
  end

end
