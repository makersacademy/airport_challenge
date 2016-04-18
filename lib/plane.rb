class Plane
  attr_reader :landed
  
  def landed?
    @landed = true
  end

  def flying
    @landed = false
  end

end
