class Plane

  def landed?
    @landed
  end

  def dock
    @landed = true
  end

  private

  attr_reader :landed

end
