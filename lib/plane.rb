class Plane

  def landed?
    @landed
  end

  def dock
    @landed = true
  end

  def take_off
    @landed = false
  end

  private

  attr_reader :landed

end
