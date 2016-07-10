class Plane
  @landed = false
  attr_accessor :landed

  def land(plane)
    @landed = true
  end

  def confirm_landing
    'The plane has landed'
  end

  def takeoff(plane)
    @landed = false
  end

  def confirm_takeoff
    'The plane has left the airport'
  end

end
