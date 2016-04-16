class Plane
  attr_reader :landed

  def land(airport)
    @landed = true
  end

  def take_off
    !@landed = false
  end

  def landed?
    landed
  end

  private
  attr_writer :landed

end
