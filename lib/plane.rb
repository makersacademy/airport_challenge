class Plane

  attr_reader :landed
  attr_reader :weather

  def depart
    @landed = false
  end

  def land
    @landed = true
  end

  def stormy
    @weather = stormy
  end
end
