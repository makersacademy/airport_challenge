class Plane
attr_reader :landed

  def land
    @landed = true
  end

  def takeoff
    landed = false
  end

  def landed?
    landed
  end

end
