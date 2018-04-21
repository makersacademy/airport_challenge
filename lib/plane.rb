class Plane

  attr_reader :landed

  def land
    @landed = true
  end

  def flying
    @landed = false
  end
end
